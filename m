Return-Path: <linux-arm-msm+bounces-109734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCRMLgNIFWqLUAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:13:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 367235D18E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36C74302F6B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D063C9881;
	Tue, 26 May 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGk+HAUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghgrUmg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913453C8C7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779553; cv=none; b=e//CnaPdsDQD6cYaDiSin8eukPSsSKa8UyUHFtEGGaLky9ork6KkEAQCDyjNKCQc++BT06ZUx4/htj9GMli8gXcXr4I2BnVxsDRUKESLTNumAO3cNGJTdz10ubi9qWGkws12fWXOHXF/rhng6feLGWSB9g6l4WN206RkgNI42hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779553; c=relaxed/simple;
	bh=duHgp5PU7H3VnmkXV/cKIwFSafwUE0CMTvpblVvvagY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkYFS9dwhyg0y4nfKLNyZHGPmFwyyt9feDxecV/dbjMOR+220uPXrvzk+zaGkDoeotTUyLvZT/nlkH6OYjVw7mwa/lW/22SyGFNcoB9UhK0xrfaRaE8bBXUtIhhcwKSlsyFIFPQjZVQO8HajqYZVDkng+oqVSVAJG6EBY7Lu5HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGk+HAUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghgrUmg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2BDUE691659
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=; b=gGk+HAUHmsFiNZW3
	kDQZOWEzXWieKVCQBc+JuGtPJPRn/XgHBE/cr+nX+ZSz63EBqwRsyZBCbJ1htuBf
	odPfeghx5Mc+Ng4mCntlFurDT4iw5vQIxlcjWl4LW7ldU0IajYS9AEdlfn1o1BJV
	kRn9Z1i5HfgM3maa64DJMCd191P/QpOCEUVWbbAUALLYybVRX4/HFOIjekF3SZ7Z
	6zj+0mjH1cscblmQxVW7UdRqVgQqFfJ3y4UCuA+YgLa1JyR34q8cc4qLfS+U3XTI
	vEydTn2fc65R0XNRLLKaHNWNvZCtr11lEDOm2WZwbzxQhun6MKuzLDuV6RqcsMOm
	Ll/cgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jtrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:12:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d191f2ccso96210261cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779549; x=1780384349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=;
        b=ghgrUmg7KMm1wH5jEgg9TyM0o9yzLFwbKq84k+0G+ILZiH8hFfwJH5Qh+2TR2xg5xL
         d3It+lIJBViCY3fFA0FhQUbj9ug0ARtNJPMaoTpmbYadyQum5/CnLdQgMTT7jCElMDVv
         tjRho/oOynuxEvrNg7D/3om1CgeEEDkIXXRy/P9adrEnnlVfFU4KvjCxTWJ6KAwApq03
         shcHyMIkg1+zojeaPWz89KXRyFONQbKqbb3r6O6yvTpSKDGmzawEWtEtsqrttipRmCDT
         XEW3+UMxqSGaZY3nj/WFQoByKZz60iBrJ2pJaZoSP9YbmGE2WmCzuFh3sWX06/nxRz46
         w44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779549; x=1780384349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=;
        b=KBtQ1gzGOOTi9C8zFxsCyk4KjYsQN8ZXVaAKYFXziIWa2TsWk7lKktGdAfKm8RuBP5
         6XeihspF+4c9tGOafsOG2v8VMJii2B9gHIGGVAu8NmCgWNR8TI1Ejm3zY08CXP6RyX0C
         cv2J2wEyKj+2ZzKQYhjBpzuDj+l6vXakWcRKvgk1LaYEBmZmOHE7qNhM+FRiuqGuxnnJ
         jxvJ+Ea7ECFgXQ51HViVvQhzAkc1uGv0OPgB3Y+ODD69LycflfIMGvsp7Mgwj91/iH9P
         Z70hs4OIpmmObkXAVH78XKQRzgPqgLlYbCXBs/sUPAXdDtkbCRRBxPB4VE/Xj4efTgIO
         h8sg==
X-Forwarded-Encrypted: i=1; AFNElJ8OHFMxAJfQQ34SyVdTQCvqWkPoV7Jwj1Alaa/t4g8DmJndrdrUwZ/W+qEeUjL4daWN29tCA289ClMbun/O@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOYiCKrMMZmK22KXs+Gj6A444ocLxtvKZ4/GOOWw01J/fpN/r
	dOlNznsfsCQHyW4NjDM8WOdJ3Feg9v5/ItknuWZG3oUCL0NqQqfZrZmIOPKYQ4xdn0w6aUPfCM1
	CJwhvykLdh/wvOic+tjzOt19bbBsIxeVGg7S1vomY0K+qXK0uCNITfjLdHmHsYmiNw8rD
X-Gm-Gg: Acq92OHeS7fTEbcl1oLW2zpySjB4FNlHhZl6/vTRxMQe60tWT710Tegb2t+TT5uK3zg
	dIf+YnKBEY9sOzbuEw2POn+YRhOU/yYLG7I11QWRXpp7uldGSUojrd6E8WhPUC9TqwYb/30a9S3
	8EKrAbEbye2ff8bsx0tGGsauaEh4rrDAC7KsQ4l1UwNKNlQDoE/uUTvGNGgyLyWWo2scO2Z4sT9
	a1tNL12yaqyHWj2ASZVE3igsYmSMslaUgqJ8CbGy2FT+Ahatwm0bTN47n8YF4G58xPvmRJKatzk
	9psCQK82Y5UQfzye//dkp3Isp6SV3XpswG11zIHLt0IdC7a7MRRqASoIkYbBgEyz38XHz8D28Wm
	TxS9BQHEietotPBNBD7gL6LvZHX2KPsRP5/krotZOyvvdQidbS2/BBERnbh+Fo9ko
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr250026041cf.11.1779779549510;
        Tue, 26 May 2026 00:12:29 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr250025791cf.11.1779779549099;
        Tue, 26 May 2026 00:12:29 -0700 (PDT)
Received: from [172.16.1.42] (135.31.0.109.rev.sfr.net. [109.0.31.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70c51sm35552477f8f.36.2026.05.26.00.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:12:28 -0700 (PDT)
Message-ID: <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:12:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: enoZxkfnHJrA5vdB0OI8_gjZ7f5y7ota
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a1547de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=yjcNvhZPqzdadiy9JSnYTw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=utSEQufgUorn1GdmO8cA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: enoZxkfnHJrA5vdB0OI8_gjZ7f5y7ota
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MSBTYWx0ZWRfXzauOlY9347kw
 4NfR/pu9hhAL0YnVe0k5poKTL1t6+YXxmNYonBwpL5kZuxc+1dYxcNidmakNoY0+yboDTzGLAAl
 yX9xVCYvkM8ME0372q998Rb3zvqnDQYWvUUG7NjhkNlcRcGDRmfXqyQsIYUq8b8it4laG/dIoms
 mcM3ZdzL8ooHA/rPPKRfyTdSx1rCaS26yiqbXaq4O2hKE83lFtUhDFKpJxs39Oo8noEtGiXHRwA
 59RWQn2zicc2EMC3KCdIcz1kVwshHVoC06cuoMv+O6aMvKEjkpO2WH8jTv899LJGaoV7x5eB1AJ
 Xl5GYk5VeFVR7UaWcX1CaGd7SR2H5bIuwjKietpoyKw/dy4dtxCKKrNuxPH9lCT1+E058bivyif
 xDsqyOBZwKvo1PYZXgLOUVWX7NMzJgIHPEkgPmdvUqYFz1oEDDj58jNH13FW1hQH0R7VHOSMAai
 q6LnIdJtvY6UlM2gbmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260061
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109734-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 367235D18E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 09:07, Taniya Das wrote:
> 
> 
> On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>>> registered as standalone GCC branch clocks.
>>
>> , otherwise .... what?
> 
> If registered as normal branch clocks, they may be gated, which
> breaks access to the EVA clock controller during clock controller probe.

At least for the gcc_eva_ahb_clk I'd expect platforms actually reference 
that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk 
it's fine as it follows other XO clocks, but please add it to the commit 
message.

-- 
With best wishes
Dmitry

