Return-Path: <linux-arm-msm+bounces-60244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEBACDF7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 908947A74E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E83028FAAF;
	Wed,  4 Jun 2025 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K87g+iFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD3028FAB3
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044486; cv=none; b=dkc0FX3EaOw+OCcuwAVq1sIPcwBmFrBS0VI8bbgoeweaI/k8fmBE25iPtfIuz3ZxkNuQOxt+uwPukD64Q9twJzGkSovm2a50U5vbjnw4rhsqSbr5SS8k5FndJpWeA7niKhq0WGbu8DeaswirivVBRcWgHKjWeSK8wUSmPPk2/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044486; c=relaxed/simple;
	bh=1kU0n2bW3hlLIxRCbwHPbQyi7Fb4CY9XVqE2C/Sy8+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObWeV35CuwmrLEaHmiVENa6V5TTYxk/e8pOpp6SJjh0WPR7JfXaAI1uhlW4fqYk9op0Wa2Oe569RwcLV9sWiGV+lO510bmPvou7zBeoQXn66K1V7d2QCujlV+1tk9PRoVSDE1aBTUdu3ZgegpiLO+2I+xDwk3LIClbTMkgRNIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K87g+iFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55487B43010388
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/ZLOV/HNol/MkyrbMnKs/oh0VOFuPImZUzRQhw3LY8=; b=K87g+iFJ17Kk+tbC
	74pCfHp6SL7Pp2K1xutgdSGMASlUdO+fSbB65gb8DBREgBlvfPZDzfzq2B73uvNs
	BCyH2xbXDX2iWh6KZaJONs2C41NWZOkRGlxhqjY8CnjHVCPbx+L3oLUZvQ5+bkZ/
	hZIjNCqkoB2CMVFSdmN/Pz+piZ4mARhPrveY7h69ngDohNQpnpbQCSHU0tOCXUwE
	F6CxPH5YLX6tH66C8TkbqZ17K8EGg3u3kRqXVGPlK9eEEWDSWb3tNVqgcm/63k/M
	tgy8HZrgOLFZ1AtyAdURvuaS/NNLiSJvUWdh39nEpWoKBChGEZD2MYab/GmWYj/R
	rBE5og==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yp6fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:41:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09ed509aaso1025215485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044483; x=1749649283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/ZLOV/HNol/MkyrbMnKs/oh0VOFuPImZUzRQhw3LY8=;
        b=B6CrXssTbidrnl0e1wd3F2Hb9mUw65Z7oADMGIf9UcOCq869DYAGTfGBcPlD+MwCOc
         ZM1dKtWU5B+pt4VKuiiYZWgazrppsUBRdVEW8bWo+EkXQQnwkxVXzw31ssy8hsodzO3k
         1jMM+K8sdHpSmYFMZL+oobIMKXdFgAIgmp8ElZir3bgtM+9zhmQ1UBZRV5YcAacC9vG6
         l5URhVpPcEr2KgJJF4Qi+M8vPGdS+gwdECE6HC6c+S1yLEWBtMDrJTQiK0hPVvrCOQPA
         x95fD2EVcCQAKdcdorFK39vjWJRMZT1cMJK5BxK27aR+pDsN7vs2lWFmppr4aVcD8dGk
         cY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxH75HQxvyUXoYTCV3FKeEYRBmyErmj+7qHi92u5WbhbQzNnP2gwWg5f1gQENkW2rZMl0rrjHBnDDcB9Ox@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qBGMC6cN0gXNm/ekrr5ertPNpbv7oWK67vrZY4aLOy0q9ehp
	gPaCMF7vE9gsKleJHUYoMbPDNI4zck1dME90rkeXQeJ5fTTGy2RXqpzI7BdIBMBKkxtetUo8CBo
	XUvJzz9NgWiVyAJDKr1SnGNiB1cFA7UolcHT9honcqLeAeGDGYveEVXfjLk1tE3QuC93M
X-Gm-Gg: ASbGncu31vV/AuJZgMaC8AiiMeqIvm16gB/OBwRwhpRR7MUFTtmjCnJIieQcSVVEnIH
	TBG8Z9WOydW5xdMToS+cGbte+JZPknKeOyn/DWkNhQFmpmzpAUMgZS/SCKZu85q2gLUdqgX1u8N
	9UPgJzL5pafkhriuw6Hh+ROjcR+jsbQ9EAWM62fWth37QrJ8dVsWmSAolQnVvv9ho7m+qUScWg2
	zYWdprK65Daae0xGtbU+sy3l6dhTPJXJGvJ9vNmsf5Y6HYsAHE8bDFHJX9b9JtGP6FPeV0oFjRC
	ElrQau4SfDYOpDe+9GOI4g3gNMAmfIEenxR94rdOjEvdef7+50rwyHCYIWk9jUvDcjNZEQ97mOx
	cOu0Ghw7mIQ==
X-Received: by 2002:a05:620a:44ca:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d21997cd79mr512470985a.25.1749044482816;
        Wed, 04 Jun 2025 06:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3op8LTfjOLqxZdhVw2i4Biz6kY73hnDxhxU2RIwZnTe0rdyBP1Nv6BjhIaJZeMxqSKmPUpQ==
X-Received: by 2002:a05:620a:44ca:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d21997cd79mr512464685a.25.1749044482199;
        Wed, 04 Jun 2025 06:41:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2a3asm21611731fa.90.2025.06.04.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:41:21 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:41:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Message-ID: <wyzyffaksofnubx72dy6uj6wuv5nk3bxii2ncdvb7ga3fegynj@z44aoiu4ywt6>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
 <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
 <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
 <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMyBTYWx0ZWRfX5Ziudi1OwvDM
 b0K/nBRzqhvbrE0uUx9hN6mr7sEf0FJCy3leCkOWuR1iYRglKvUokA+MsxaQfBjFJ1O2nItX3a4
 xIcPh+efvperSMgDzNYHJZY18eLwh8N//2wLq27spQaKNiH9bOuw1vKiEMvq/Prgg9qwCnw/aLF
 bVnwIVooW4soZYm3x5iD8Nwvax4aIXAAnKgzBTdY3KmePyt9xRVd83lQxXMs5xNX02Wq5wKnYzN
 MD3CBHLFqhuLBAUqwN90bf1QKy7mSSvVd61PyPsK+mqmTfJMmuwO/9VODAmEj91NSPK6umeZaXf
 GjvIoEy8jZn0cUvsfivT0uKh3UXcDqLK/NKk4sF1MVTDdjAUBVYul4JnG944OAvRNJ9M9/uMsvO
 VEFka/sIrN+udkcAhz833Z6ncRjnEfXqZAOYz+u0kVQvy80+k3GZke/TLHhiUBm5FRaHe6X6
X-Proofpoint-ORIG-GUID: _V_oPHFZO4W7O6FbT6ntqyZ1hvDQnAAT
X-Proofpoint-GUID: _V_oPHFZO4W7O6FbT6ntqyZ1hvDQnAAT
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=68404d03 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=i_0oWf60KM-UqR_2WRwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040103

On Wed, Jun 04, 2025 at 03:24:25PM +0200, Konrad Dybcio wrote:
> On 6/4/25 2:05 PM, Renjiang Han wrote:
> > 
> > On 6/3/2025 9:21 PM, Dmitry Baryshkov wrote:
> >> On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
> >>> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>>> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
> >>>>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
> >>>>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
> >>>>>>> Add the venus node to the devicetree for the qcs615 platform to enable
> >>>>>>> video functionality. The qcs615 platform currently lacks video
> >>>>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
> >>>>>>> to the same video core.
> >>>>>>>
> >>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> >>>>>>> ---
> >>>>>> [...]
> >>>>>>
> >>>>>>> +            interconnect-names = "video-mem",
> >>>>>>> +                         "cpu-cfg";
> >>>>>>> +
> >>>>>>> +            iommus = <&apps_smmu 0xe40 0x20>;
> >>>>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
> >>>>> OK. Will update it with next version.
> >>>> How would you update this?
> >>> Thanks for your comments. I'll update it like this.
> >>> iommus = <&apps_smmu 0xe60 0x20>;
> >>>
> >>> This 0xe40 SID was based on a previous project. However, after rechecking
> >>> the documentation yesterday and confirming with colleagues, the correct
> >>> SID value should be 0xe60. I’ve also validated it on local device, it
> >>> works as expected. The reason 0xe40 seemed to work earlier is due to the
> >>> mask value being 0x20, which causes the effective SID derived from 0xe40
> >>> to be the same as 0xe60.
> >> Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
> >> in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.
> > 
> > Hi Dmitry
> > 
> > Thank you for your comment.
> > 
> > I’ve followed up on this sid with a colleague from the kernel team,
> > and based on our discussion, it seems that the sid in this case should
> > be the result sid. The actual sid is 0xe60, and with a mask of 0x20,
> > the resulting sid would be 0xe40. Therefore, it should be <0xe40 0x20>.
> > 
> > @Konrad, I’d appreciate any thoughts or suggestions you might have on it.
> 
> What our docs describe as 'result sid' is literally 'base ~& mask', so if
> we used that, setting the mask would be useless..
> 
> Now, some old NHLOS builds are known to cause issues if the values aren't
> exactly what they expect (some whitelisting must be going on there).
> 
> I don't think this should be an issue on this platform, but let's just
> use 0xe60 0x20 here to reflect the real values

Isn't 0xe40 also 'real'?

-- 
With best wishes
Dmitry

