Return-Path: <linux-arm-msm+bounces-63471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0D2AF651F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 00:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FF0A521CAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 22:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29874246BB6;
	Wed,  2 Jul 2025 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nw8QAjP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8F24468B
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495172; cv=none; b=i6yBdAUxRTnu3escc5HbLgF/L2BQaxldHC9UQDXxAzXDP37EHMW0F2Dbac3PZCxiWdII80PuDuu+gOP7984HEVWg3od6c4EEEzb1mmc2mL3GXZ7bdKf8VdCyN82zBkMhP9mv/xWIGDe2v2eVbXtCO7K5PaGg1KUpIS4++8b2rqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495172; c=relaxed/simple;
	bh=YXkp32VHnnjpgTsSIj8HLJsEQ/FUBPYm/UP4Naxfbcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ6q3CH2M6pIEMgLQCxVRl+/z/UzZgi1g3W7Qlpus5Eal9duuzGmNiSSg504+R++c0O42hZZx9+4cWFg/aj5aP5tb19nSOzWhjbJQK1r8VGSB9jMXDhh44HVJzlW0fFkT2T0U097XzFXfJA+xc5W8W0ZBFEe0fZcPj6kc5JrAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nw8QAjP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562KVCMe007093
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 22:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MK0+Ls5pDqiJ6P4kbBMFpl+U
	Brrw5KjzX55rd6Zmy1s=; b=nw8QAjP4mmLdP1skCs/UEe9pDiknMqcZUfuxL4dM
	de9u0UZbs2ymcanqTweZQ6iQ1OX67tr84CYBAAIdc73NorCpsT+yRLyWuj7PfmWe
	3uB2oINDIVVTSZLHZtl2gATvTCf/FkiIN5FD/Bult7xtq5FVf1rfqp8sHTN8ut7t
	pZlYwIv1cxHMd2RIw9R1EBvYxeCQ1zKGMl1ODMlesVJ2dK8hou8N6x6FU3M4khuN
	VDLsEE7N8yI23Cim8QbuQRwOX/lOKonFTt58fbZbajeF9B/Cw9k+aYnA+XbnTTYH
	+CUixRKMDPxeGyU5tpNG2qy4dfcS8zp4z8pxsy1S4rsZeQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jjnrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 22:26:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so62472385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 15:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495168; x=1752099968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK0+Ls5pDqiJ6P4kbBMFpl+UBrrw5KjzX55rd6Zmy1s=;
        b=QsvY+VRbCY5VGoQhqTe5Y9uMz3/e2nFo09Ef5OGMYNm0vlK/WcO19pYguUmV/0lM88
         KruPW4pFJ1COGsX50a127KfWsn/1zirDx0lKJlse8QHTMnRWYJxkvYtuRqX5vn6O2Wp8
         AQCzb4qZSgPxaZYmT0oHUi/I74sOfmaaZlDGwwMFv2V9L2D6D2AKWQiOZ5CnnC4oRoDE
         CDFNxU8V7vGk/zynz0D4w3poWOwsXg8jo+KSqQ/cBT8iKGZnYzpzcG3TPi+mGylL91vW
         Cq3sCfmgS+9MGMEirWgfUFReUefwa8qTmgQ09ZFd+ZPpO+OffOILzYwWoM8txLmqoe6O
         aeSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIYvJWVoAnpNm93Yu1V+1EIvcj1RjEmb7VUmu4Q4uCWwNXBGElyXPnpLrqFfWOOeLDVEyru8ANuoEC6RHA@vger.kernel.org
X-Gm-Message-State: AOJu0YyF9VYzSNgVAwIsaUQ9bnUD7WQCjvZKYnPQ02/3VjpYC6ZCT1Z9
	1OMgRucsaV/gcvpIciOnvfvn38RqU2/AGig7Pev6MtRdY8QTWgdlOw/j4va12ZRi5/eZuJEUhue
	PLL+ORlFCrHwLPqLyq3g2+PYbTmeufUBNcHliD48BvOh8m6lSDWf3vquMZMIb+w2r7pNV
X-Gm-Gg: ASbGncvei10xsxu+zI+wUvrqydrGbcpK7k13q2LxYXzCM7S+P34rR4X5HcKH9Iu4H77
	PSWuelcG1f4aFr/Ibs0r/HybBEZ2GDH2w2WPZlAI3JFZ/YlWXeiCD7Mh/SvD3YJ8RazaC3xKwb+
	+t5s5p0h8nF0OjE5PeoQdU1vYJoiZ5dV1hOHN9+/YtoKdfB1lxqj0Ajtd8F2E+l74iBxBmc2f7D
	0B/FRdPArCK26LyOL76UAWyGQdolLAXfOh5AtbXM+a3550r2BgyDbgOB/c4VaWDUudmTyGRWHqG
	0knwFjOJaxprpzkjrpNFxWBWAlmJUTfNmdAvZUo3esH2IihNsHbzgF2f/Jd1sd66e//2D5BlFO5
	663h2Ge71EPhLJh8DGCtSy3P+NOt+6YqTJzk=
X-Received: by 2002:a05:620a:2546:b0:7d4:3b37:7bf0 with SMTP id af79cd13be357-7d5d1482a5dmr197262585a.8.1751495168408;
        Wed, 02 Jul 2025 15:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2X5tx2tZqNp1T+kumsXTFd+kd61L9urkmpDGTTHsoabTZ4LaAF8wZPfA8E/m43TRPQFGOUw==
X-Received: by 2002:a05:620a:2546:b0:7d4:3b37:7bf0 with SMTP id af79cd13be357-7d5d1482a5dmr197258385a.8.1751495168000;
        Wed, 02 Jul 2025 15:26:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73f6sm2262230e87.138.2025.07.02.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:26:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:26:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6865b201 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=1XE270qXan2-a6Ey660A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: PZ7LnIXpCG3KWP-9SN357oGNjG9YusAK
X-Proofpoint-GUID: PZ7LnIXpCG3KWP-9SN357oGNjG9YusAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NiBTYWx0ZWRfX9EUljKUYwzKJ
 VlBiBR6mvrOtawbug2O9yjR5bcbyZ6nMqZmdZxwvB56evDPIajSovb6D5/p3lpdTwyDuoCbOX6G
 YHrCxWPBloShjzW+i7auulFCa5ZjtH5NpWKSCgr5HxT5IwHTHYKU8qtUi6P1rBSXfy+b0mapLLP
 s75cr31EiizV00paaJ1gckf2CXowM4YsokeiKdHbMukkKUY+Y/g2XrA4N6VCE1drbnNMoxCCwoK
 j6d/jmcRvNwgjedS3i2cZTW0MEnDq43m7fusWzmkbvrxH3gIdsi0mvkLsaqssplM2iAvH6V7LRk
 0vkl8lavfEYAX9FHrC89R4OoGV/SdBTaqM3X2FkuTrA9S3KVEOtPMUQrQWbvDZvLNYiw+LiThz1
 IU5uOWCZW36Wujtu/PzSk2d4mfIZFcoke7AZWjYo6JkoB7i4+EcruGAz60AoNyHxz3UUrbNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=730 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020186

On Wed, Jul 02, 2025 at 01:06:17PM +0100, Bryan O'Donoghue wrote:
> On 02/07/2025 13:01, Vikash Garodia wrote:
> > > Anyway, in other messages I explained what is missing. You are changing
> > > existing hardware and you clearly must explain how existing hardware is
> > > affected, how can we reproduce it, how users are affected.
> > Exactly all of these i have explained in the commit message. The limitation with
> > existing hardware binding usage and how my new approach mitigates that limition.
> > 
> > Coming to usecase, i made a generic comment saying usecases which needs higher
> > IOVA, i can add the explicit detail about usecase like 8k or higher
> > concurrencies like 32 or higher concurrent sessions.
> 
> Why not make this change for a new SoC, instead of an existing ?

Because we definitely want to improve support for older SoCs too.

> 
> That way you don't have to make the argument for retrospective ABI changes.
> 
> ---
> bod

-- 
With best wishes
Dmitry

