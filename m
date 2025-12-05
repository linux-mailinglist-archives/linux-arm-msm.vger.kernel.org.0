Return-Path: <linux-arm-msm+bounces-84509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF8CA9463
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 388DA30E1D50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACF827FD52;
	Fri,  5 Dec 2025 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJyymNa/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UYowerxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7401DDF3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764966858; cv=none; b=JXyBSSS3ubG37TJIzUS3A09D3ieJxxWME3myvnidjIM7U7CTfGoDj7aE8T3+ZnzwJur5u9sW4BrU5GjK/INiE0DuVKKx6pEoc/0SkI20IITeFySV1H8o7D9bSQO3lmH765/hVRKxWfED+4K3ypbis5fGmDjNkzabSw8xL9Y7vdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764966858; c=relaxed/simple;
	bh=VDlNvm2vIRrbe2yBVmyHq1Q8se4YRQymGapdJvOhedE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UByLdKwM9M61j2mgBME0FY6xBPiG9NdvlacrvfZ2q1GLc4AI6unxITshV6ie+Nf8BGY6U1bE3qIB3Dmhp8jnKhrUm9kl9xF7oKr/eB/t+5dtqoIT+7svvW7zN9FjrGiT+UjaB0C1bavTZe7gHWfMHeXerg5SQT36sXISYXLtZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJyymNa/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UYowerxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBMCM887446
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ehuzl35F4YAd5WxwHE5AJrYf
	pPfLCfoNEcUsRWmL6k0=; b=lJyymNa/xcnscmqNakItzrmw/Ty4x8cGHG4fzKfb
	bzO21gbDHMrc8i3tmer42h//uSwpfR7UEs9xO/dnAuJ2TGHAva/xqNWwO/3RDbOS
	KFHI2qWC6itwoe8wBJGXHwOLzrHQqSqq+0ucYlATPP4JIKQ4wHedXKNhWb7Wjz22
	ceUEFFU3SytpmwW6TLsf1N1MwncE7jNrfiE8SxN194uIP20jbIupwiS8KZh3qmKQ
	78syJ+98W8HseTgiXNaQnG5tI1cwn3ectMxTSh4gjaiV9y0Jg4TCicTbm6QdBgYb
	NhtaMe7+MdIPH42IL8T30VPsyYKazOMMGahCXdMrJklgRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aurwvjgx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:34:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51396f3efso430659985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764966855; x=1765571655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehuzl35F4YAd5WxwHE5AJrYfpPfLCfoNEcUsRWmL6k0=;
        b=UYowerxjHNLC73fAsuQGWu6LQ+7h6Grj5Dpkd9SHt9jSvENJCZ2Bsu9L8x2sdbrYGq
         Nmxg6L5wBnT95JaTLECwxqGKL5nTVZXRv2nPotlzpE/xAq3S6BR02EhsCVNSdBS6Zyuy
         7yz3nU3T/ERT4LDT9FWcTLlK4dQWXWnnkNSr+wjTdFVY/ofCs2Yh8QWzcnoHRqGZrE6O
         7FDnR2Ag2gQJs9+jcQ49amcW2669pn0tjBq7zLAM9iopvNh6JMZNheR33jTSoIOufs4i
         vpjyOMYKqXipsg3Z+5gYtl/rArIpOoDPqIhsX660q/8TS0IasydMyyX/mOP9itndVWNb
         biMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764966855; x=1765571655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehuzl35F4YAd5WxwHE5AJrYfpPfLCfoNEcUsRWmL6k0=;
        b=kigZU6eHWfWBF/kqFvsHZTtaEOhZR0SvwLwJNnCC7aB/fx9UJ8T9mW3Urf5RBzyHhE
         FHjofLDirqjwEytApQsHzX0ij8qeF2KJGvEpOvMqaBHHOzBYQD4iaJ34ADLzx8vCUuDz
         M8PxtFhiodH3BVBV2x/w3WZCRIneG5lTWRBfpNwNTjZE0e4kR9VHXN8qbtl7l1eKtVqM
         GKgVXxurPtgC+uabRdAouMMKJeONxOJY4pYIInFkzLZ0Q+uqTANReKM0L3BXNyemLu++
         0mNrzTV+hLIGWCJGj+Q0hG5IMXcmaQQ8hI2qiUw1mI47SHg3yYRpaMH6uEWZCEM5LtbZ
         gObw==
X-Forwarded-Encrypted: i=1; AJvYcCUkizCw0Q549A1O0UOQ35O16Gru2o0oUGQ+qU74h+mNjp/r6iLT7E0KUuzmEy5WhKHqKPB5f984BXYemFgC@vger.kernel.org
X-Gm-Message-State: AOJu0YzLUg8VBO0YVcePsjt1kbPWnG/5ZFVUTD3PQGzakeJ0ZGSBK/3J
	Sz/6gR8Hskt1i93adY6xoW5A7L834iHvCCbWO1Bhl8P6gX1jtgMFisOKJ+LiEDZwq188jMoKX7L
	N7lmWxpnCsmn0pK/STjkN1dFelhax/ds0U5GcOYC9JiPLJl/w3g/vbp43fu5O3QIWgqHx
X-Gm-Gg: ASbGncvYrCKAwDDQQZFGYmj8xnd+NhpKIf/kZxlReQU1OY+DgjLy7n2dnSsneVuAVja
	oQWBVRy1sZeX3UWOzWOAiNSof9ywpD1BnACnqU2TYh6KnQ1psI/IrOvnJIAFoPRI6DhD2Fam/6d
	ClJQaLvl8B1HqMJWdtRmlbZShBlsH+1tE7jZAa/AkV6lJRW92EP4CwwnYw72S/m1je7p4uZZczB
	OrnXBz36CFvcEqzNEZVrc/8XOPFMDIJahgndmCt7JlAFdrK6ibYNkTWYkZMTefsLhOSkqOfkh4E
	JPUNTMGgTBonrAaLRncDibGz4EZxjXFtcdIqbi3xXhXXFI9rGkKVTF2ymDJ9FXzx4kGPPF2o8Bi
	/SZ3IMWZZhK22gP571Tl4DdBhInZL0jsjpdWz+ARhgqMc55bSXNWEkD/4G6PVOeILA8NxL9Lu1L
	L9rlrjZdoRIijg8FLrHr7F6iE=
X-Received: by 2002:a05:620a:28c5:b0:8b2:1f04:f83 with SMTP id af79cd13be357-8b6a23e4122mr47640285a.70.1764966855094;
        Fri, 05 Dec 2025 12:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSJwImahBezA+ehEO+rgt/lG9XeY7S3IiD1k9RLtugDrQeAM1A3hmwstsLFPwhVXBehFvy6w==
X-Received: by 2002:a05:620a:28c5:b0:8b2:1f04:f83 with SMTP id af79cd13be357-8b6a23e4122mr47637085a.70.1764966854603;
        Fri, 05 Dec 2025 12:34:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c281aasm1781336e87.82.2025.12.05.12.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:34:13 -0800 (PST)
Date: Fri, 5 Dec 2025 22:34:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Message-ID: <2e5sqv2gnxdfwnfsepzdkchxip5zdeamp6bzbamq6kbk77kr3p@u5i4rrnrywno>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <3gqq3w6ovy5srgvabyeugsjbwrhaxmjvicykhjmlcxd74gtsaf@5u6wvvzeq52z>
 <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90bc84e7-19ca-450d-b41f-fd96367e8cce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1MyBTYWx0ZWRfX93KKvpRtb8zb
 CKCgHLUcR3vZEWFNxsz9STQyDhwMCWhGIminHKM2yL6LdM0L9U6JuAaaPWiWWfWegf5vTU2PsIt
 gi3BjErLQs8uHEYQicQles7rtDUQx8f7z5fTpJRTd7VFj+a58u8mNC3a7RRQkFmHqpeAM1ggA6o
 /1CDuSZ4NuVq4hgO4qqnZ7TyvVQ+NFA3c/TX3eEXkklwhXHc7TDsF+hrIqcHmAl30MTQNiKE651
 N72hw8suuJUwC4tv60lHeQT5g3LJOjlaKXjKObdXigVsCI3xKVGDHvQNkrAWHrRkYAbWpt9MmAm
 vBAVXSFkz/AWHSJSJb7WbsRNfJo/31H9HqIwgg1EFXgm3ukGrt6PaaU3K41Y/kRswnbp0Wjufok
 rJuKOmjr+v+Oe8kL+sfVfoHJur+Xjg==
X-Authority-Analysis: v=2.4 cv=Yd2wJgRf c=1 sm=1 tr=0 ts=693341c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JECPFCAl0qZ1QQZhDD8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2uzlSSrM3l_Mv_wfj_8CFeeBYs7uLV1C
X-Proofpoint-ORIG-GUID: 2uzlSSrM3l_Mv_wfj_8CFeeBYs7uLV1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050153

On Fri, Dec 05, 2025 at 03:59:09PM +0530, Akhil P Oommen wrote:
> On 12/4/2025 7:49 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 04, 2025 at 03:43:33PM +0530, Akhil P Oommen wrote:
> >> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
> >>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
> >>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
> >>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>>
> >>>>> Add gpu and rgmu nodes for qcs615 chipset.
> >>>>>
> >>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> >>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +			gpu_opp_table: opp-table {
> >>>>> +				compatible = "operating-points-v2";
> >>>>> +
> >>>>> +				opp-845000000 {
> >>>>> +					opp-hz = /bits/ 64 <845000000>;
> >>>>> +					required-opps = <&rpmhpd_opp_turbo>;
> >>>>> +					opp-peak-kBps = <7050000>;
> >>>>> +				};
> >>>>
> >>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
> >>>> or mobile parts specifically?
> >>>
> >>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
> >>> here.
> >>
> >> The IoT/Auto variants have a different frequency plan compared to the
> >> mobile variant. I reviewed the downstream code and this aligns with that
> >> except the 290Mhz corner. We can remove that one.
> >>
> >> Here we are describing the IoT variant of Talos. So we can ignore the
> >> speedbins from the mobile variant until that is supported.
> > 
> > No, we are describing just Talos, which hopefully covers both mobile and
> > non-mobile platforms.
> 
> We cannot assume that.
> 
> Even if we assume that there is no variation in silicon, the firmware
> (AOP, TZ, HYP etc) is different between mobile and IoT version. So it is
> wise to use the configuration that is commercialized, especially when it
> is power related.

How does it affect the speed bins? I'd really prefer if we:
- describe OPP tables and speed bins here
- remove speed bins cell for the Auto / IoT boards
- make sure that the driver uses the IoT bin if there is no speed bin
  declared in the GPU.

-- 
With best wishes
Dmitry

