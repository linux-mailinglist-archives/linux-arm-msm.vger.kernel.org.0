Return-Path: <linux-arm-msm+bounces-94803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOMrNoVNpWmt8AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:42:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66E1D4C2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCF1930210DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97634383C8A;
	Mon,  2 Mar 2026 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLtkOm2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsBL9S5R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C326212FAD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440929; cv=none; b=jF4BNH9hU5RFTC/jxcCorpMVAgO6Y/+HmWpEEwF9iScYMcrgUxp8Hqld87x6fk8f161+hQj6D7NAn6ycb38roAvOlU3D2uQ93pEzunx44oviVqB13r00ErrBN0XJ0b4svHYCmUVo90CJ05e9+0TQrBR22BbyJJFYAWraaoXY+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440929; c=relaxed/simple;
	bh=b7/GQlQqA57Sa/KgKkOW9sXVkTVLiqDv7U9/FioO5W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkDRJ2MRnm46D0nXrRGF5gb8si9bs0Iteq3lGZRcDf9oeT8a9IXc4O7x287cKw5VA40RfDIzE8culwZqvIsmSgZFpAvoSX3OnMwwJl2euBw90JChvjn5TKEZxpoOMTM+miMx/RgMpODrrPh2nhmWRawLeBSid3U1Kw3vFxHp6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLtkOm2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsBL9S5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228F0Id1952593
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=; b=nLtkOm2AHu9HoX1v
	oa1xnNMoezDDTz1ISvqkk7cJbAS2xyrhLYLVIWnZA80l/l2cOkEG2/KpwDkvyB8e
	jO9I8AvstnA0YOlfbm6jKlc/BfzpNQUQhO7M8CbWaa/iIZBeku+grClltUlY1Vmq
	EJ6/mh3P31+KsvQppLQFGemEp5R+T6T9EjirlueknNDz/uN5Sn4RQbIV+FM9Pxe9
	NMh2Xtqnbbox/mLdZoK/Lgp9YfcRJXJI3/0cn9RIf2b9mRwcEszcYeBDUGaFcd79
	IYruUus9C3cl6zA4w23dEUx1wOHUIpN9YKm/kH6d1tiKBMgLjt2l8AYHTe0gX2wj
	6+eHkQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkvrfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:42:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso21575205a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440926; x=1773045726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=;
        b=SsBL9S5RDr1x93GOdqaLD9y7wY7bk03yogyEr9XIN3z+Um/XCrBavM5Fbcd01dTrFD
         0V4R4GJJ7lKmVtTLdhLC2jl4tc9zR6RAQmxXSWgMi0BtrUR9a4P9PpKia3ZDd57f+pCQ
         B1VjldRLslXnL9Iu4YH0pL4vSvxpKtsMD/Ltb5zHbEowc582Bk1fEDO7FMXsXEOwXmxd
         SEvP+0TaBIOfZx+/CWJ5AZ0Dghh/DNdLoO8IEJQyQ8j3v61B2xXUSh33W0C2DTGBq6w4
         Vx47JRtVh6EqzRebLl4T03OhUrL3YL51RmjeIsHizJct0CL4EAewU2L0spGF1judUl5L
         Mxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440926; x=1773045726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=;
        b=OqIj4Xrr0bwEQs0NVZE41o0iG2b3HqayiTqfQAu+ws9UIcVH0W7L0swB/rnlhDh0ld
         w7x9J9TTig2Kf53kej554lVMQNJNlpNuOa9urq0if0IKOQyHVATvfX3BxCbxwVSRpxsl
         K8nIVgEBr4F87o4xE3bGeGaX4TINkPLYkVZYleNqyXoSz0N0JIKWQcbNdLNOD1/DBStr
         DwiM0my0FgmRrIFzABAwDJi8Anu2IKIl1LeSPp3mB/gP4fc6DqCoiCR6fIzM+fHlbPLq
         JzeyoF+hr2ZvSNn+DUzLllJldU24x7KqSeRkaEr7g+4WwtPlqBgsZIh8RvcPuhb0rruA
         /Xzg==
X-Forwarded-Encrypted: i=1; AJvYcCXYDaaUjT2dZ+ugKhFOuRbhuDq7lQAdTuHEOQc4kwPWDfdnIj7G+YxX0WyUpbAaWRAPSILDM+V0Qh51xwXx@vger.kernel.org
X-Gm-Message-State: AOJu0YzXG3x/r+BuqnvvJ5T6G+i+rBPCe8mYab5M+2fWbjYJXbLtf/c3
	KibBNKhLdyEAnlmPUPPoiybFtOAxG6d8TG58tcCmY1AXBk+6t7D9io7comLTGbSvgOY6C1lMWfS
	dSlWuJ64ykgI4FU/lOF4YUYGIgscW3iw8Kfzny/pb1i7esCKGQ03E4OFTZQ/k5f1l4nZ1
X-Gm-Gg: ATEYQzzu56lvT44Xoa0WdXlxt0yvfLGMWCVhbX0n6sqmzkPuzPylav2KXvLzfmnErKN
	Zc0DrMg8ore8S0KEyPurJyuk/UkKLc0C/JErOi5EV8ZPLyRDYC4ZmYIW0mP+qDXJAWCtS59wkN8
	KRFO8NwQ5lJngm0FLqqU+E2+jLvkhqL9z4XEgUui6Lj1D3yqPphJ+Q6W/RLHBpsgFrAEXT0/e/Y
	p/4CBbgQqIfZ+bNhAXtfRLrquOLorcuNfzF112lZwxe1txyrLNLhhGPJLiGYH02XiRozwZerOCz
	sT/g3LY/PxhQEvZsagrhkpc1ZgCQP/x+wcWe5opBK6RF4mmPfqNBBgcsN4DsbbktHJXu8vyLWh9
	rcdXfehlmu05Am8yEj5JfdrB1CRN72pRd+GjuRHla2YBqJE+bqw==
X-Received: by 2002:a05:6a00:2d09:b0:821:8492:7f73 with SMTP id d2e1a72fcca58-8274da7a78fmr12008611b3a.63.1772440926273;
        Mon, 02 Mar 2026 00:42:06 -0800 (PST)
X-Received: by 2002:a05:6a00:2d09:b0:821:8492:7f73 with SMTP id d2e1a72fcca58-8274da7a78fmr12008567b3a.63.1772440925746;
        Mon, 02 Mar 2026 00:42:05 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01a99esm15377234b3a.47.2026.03.02.00.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:42:05 -0800 (PST)
Message-ID: <207b4008-b32e-45d0-9ebb-a32b2a5edfd1@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:11:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
 <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfXzjvhGVDZCL5Y
 1cc54zt4qZoLOh7HFmrNmlHNvywKXgXHgcpzyqf6KoAHqxrLSYF44c/bIJKOdC1DPeCra03Wply
 o9/8UTOL/a4eBUztJ8pQrbjEXue6XZr7uoVIHZ0O8fCKfL00MlcG37Hu4/WixskB3W6OOmTwrBF
 Zq0DAIbNB6HysVy9/gfMq5gu5obttRZqeMPJ2/Eo7A0no7nHu9oGnsHUQX1E1O2R//wGJ2cFwxK
 7tNFV+f5D0San8kSpHN78pC/ta24Jx/slv8WfXCm8hNvtTziJbYXa0PbaOInnlAt2yEzFq5HvRz
 5QQLzGP9ar6M6UP/Q2CVs4TNy9DPxRNb65Etkm44hRHDRdWjI2Ji0cqkCB86DkIOQLNGoib/gHn
 YlU+yeTqNEOUJRIHKZYbpvD7+68Qqlccg72Yoy0dnNoGh6FoMjaAJAOHW8nO18xmDhSb5MSzOD6
 4JSoiVvZWgal9FHvn7Q==
X-Proofpoint-ORIG-GUID: 99C4KGEp0v9WntJFaMEWuWP1L4ef7x1n
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a54d5f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=f53fbDee1N-zenCa03cA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 99C4KGEp0v9WntJFaMEWuWP1L4ef7x1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D66E1D4C2F
X-Rspamd-Action: no action



On 2/24/2026 4:10 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:12AM +0530, Ekansh Gupta wrote:
>> Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
>> driver. The entry lists the primary maintainer, the linux-arm-msm and
>> dri-devel mailing lists, and covers all source files under
>> drivers/accel/qda, Documentation/accel/qda and the UAPI header
>> include/uapi/drm/qda_accel.h.
>>
>> This ensures that patches to the QDA driver and its public API are
>> tracked and routed to the appropriate reviewers as the driver is
>> integrated into the DRM accel subsystem.
> Please add it in the first patch.
ack
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 71f76fddebbf..78b8b82a6370 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21691,6 +21691,15 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>  F:	drivers/crypto/qce/
>>  
>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +F:	Documentation/accel/qda/
>> +F:	drivers/accel/qda/
>> +F:	include/uapi/drm/qda_accel.h
>> +
>>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
>>  M:	Timur Tabi <timur@kernel.org>
>>  L:	netdev@vger.kernel.org
>>
>> -- 
>> 2.34.1
>>


