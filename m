Return-Path: <linux-arm-msm+bounces-91769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEnVHDLWgml5cQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:16:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C730EE1D8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6469305AC92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C20353EE1;
	Wed,  4 Feb 2026 05:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTZtq4MM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGhj9VRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C5330B00
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 05:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770181849; cv=none; b=DPwWepmAFEO5bAw+Qh5xEm2e5h3Pgz1a6aXkPjKpIi3vj6U32k30/TFmhsrCeUEfIyB17nf/DhpL0UjIUq81zId0ZuIWIWdHx5nYCFCsggZ1dRdRscEin8I7vIyeYKz/V3M9HRXG/YLeC6Avf42qnjBUaWYB1XA0n36V64k+IpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770181849; c=relaxed/simple;
	bh=Cl8nmQiPPZ3zMD2xLWnUAdj/4XyXZt4JU5y4x0hFQpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHH097Hv6vCXvmdhhwqCkm5j4NMLwX63Cn6iIKs7qacX1AjWcENKyeD922b3AzH3SstxFifbq+zQ/12N/RLSd5lLdaD8lqC7lPCs1HSgq5Onu/fkQlKDTxTJRvGNlWiBzp++O/BcCsYTqmj/aIqIJrvui/pgXPZ/yGRTUfrHwEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTZtq4MM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGhj9VRL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144DRRs2963023
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 05:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2yk1SXP0cSKoeq0NtffjWATsVhRHufpkROfd+0puu4=; b=PTZtq4MMpmAemyhd
	/KsLx2pZ9SnScDMJRJEY8rLfgsO6mhkzGvBZ0jo0L+op7ABudMvxKUHIkedclzlK
	Agb0W3vl8gG+gjU+dVN6TdZm3rNfFKQQPsyZHgAKuB2AbVk8m6phBD4+4g3vmpwB
	gxw28YvVGv86H9TgYCyT7cET5IfUtFptxkfL7TMJVs7eIZHJk7y/PA5U0EyIsadn
	DWfiivpnlCdxAIwu5vpqeGSmPBs9oh+d7fdRQK7wLOozWmOKBylTpZqldFd0IdUj
	/iOp8QhEjQ8VOCvh9WuEMBQRP7s/iuzT6lIb35OzQLqElbiTY0VQHbAMLuBrVFdz
	DlB0NQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ne7sy9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:10:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a90e8b54f0so99739575ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770181848; x=1770786648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b2yk1SXP0cSKoeq0NtffjWATsVhRHufpkROfd+0puu4=;
        b=XGhj9VRLhA2NL7K976NIgA5cttTZNFWCBaeAbz954OH52LHDhkAvuIfC5qLg7heoLc
         RsEIul/EcRcyskxmSgzJ5407JrmfFIoiUOt8Llt6pQTOhTm4Jztpu4R5Hcet4rjzMtZ6
         4TPGz7etF+QBw3lYuKz0GVOAYkBaIT2t8+BmrmbOPYveFzZOtYiol0CFTqp2YV7p5FM1
         aEcuSPNrNgYvStm6/itMiMGfL8sq7kwzrj0uiAKPWVFpT6ibSIkV+1wiym0hdZx/pWCR
         tqcCkBGWzNepDY0EG8X0CUDE62cy2vvEx+uI4ixIVyuWKj+244mTi9CR2f6JpRc4/TAD
         0Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770181848; x=1770786648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2yk1SXP0cSKoeq0NtffjWATsVhRHufpkROfd+0puu4=;
        b=BHIO/b++pAsUy8mzQdxjC8Xf7XRjsWbuBQvrfNBMwxd4IX8zQLs/lsVzW+xlUWZUGN
         PGdsbtxAxHw4fl67JhVxx2VkcD9Zr6X9wFO80KB7oH+RVVowW16zOmKS0LG4Vz18hQo9
         3BdhmRgbbf44dMu5oXU04ExvVNohw8EQVLwhhuvX+o0IYSqTVT/OW2tqhXNHR/rC1RQA
         DYZyYJPtKCpDZCXM5fY3bqnts7rCgXry4jYohhcppGTkvlq02pwe7ittq9aXGNJN2o74
         Tvy8ibAzCGLDDn2a5n/y1L/wFFspdXe0YpMpFglvDf/hJpq+d+qkqO5b7NpTdTGXholF
         Y6hA==
X-Forwarded-Encrypted: i=1; AJvYcCUBz+4/p7a+onx5Ni8j0gdtcn8oWz7MV4EuUh4H3ew46gRa++r3eYq/OhW89sgki9whzZGEdnluDMc9TL5M@vger.kernel.org
X-Gm-Message-State: AOJu0YyZqpRPZ1jQOs3Xg13g9nwmXOd4av6ZWSdlQiGyfM7DydZyLLSt
	gKeNOr6rlXrZ5Dk45u3n/0Uw5zvkl2merUeHtx9M7hHEC+1tZ8O05v3TRf65xwmdjAQZXshFnMp
	dRZBaIaC54fa5TqLNcYDh5ms4J97uWUKIXn6EBz9MrZGV6W1emCnu2tS9bht7rWYLpRlv
X-Gm-Gg: AZuq6aIXs2YqBqdtqospJezMx1wUY6e1KeghYa0nElMpFAx9QMLuZiDs/NTvRV7lGK6
	fViJDm3Zc0NPLflrbtvXbIvwLQyQYEIT8cQy00CclDYiEtlYO9iCcHf7Wa1qt+5cqnF+EvRRe+U
	1fggRIP7TDAfnj4S43zZCOQVRT475YEQ0/U/C7J69exZ9gEobpJjU4Dw1oShZif2Jj11A8zaPjh
	L23YiPSQay0OJQ5T9CVX2QSzhAR6EVGWXGhvmHNcphitxla6cTb9WZ56A1NycWZam3D738g6wYH
	cZ7I7AtwfmVSYudtcu63ZGK5YJw1Lmxv07QYKsV2uheZFJqCthH2sCHXATHntGW024mkkYG5lQN
	uj1MBtYQiAb2Hy8ftClXh1QA4saQltFlZz5GHnHAdCA==
X-Received: by 2002:a17:903:2447:b0:2a0:b06d:1585 with SMTP id d9443c01a7336-2a933ea08d3mr17630895ad.34.1770181847579;
        Tue, 03 Feb 2026 21:10:47 -0800 (PST)
X-Received: by 2002:a17:903:2447:b0:2a0:b06d:1585 with SMTP id d9443c01a7336-2a933ea08d3mr17630495ad.34.1770181846953;
        Tue, 03 Feb 2026 21:10:46 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933888e8csm12620115ad.29.2026.02.03.21.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:10:46 -0800 (PST)
Message-ID: <d4a51e98-72ae-49c4-80ec-fe3784c3e8f1@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:40:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] soc: qcom: geni-se: Introduce helper API for
 attaching power domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-7-praveen.talari@oss.qualcomm.com>
 <2d2bc77b-715d-4484-86c4-4389ebb63856@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2d2bc77b-715d-4484-86c4-4389ebb63856@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ElAPHZKnl9fPHd-A9ECfDSfEfg8Apnl_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNSBTYWx0ZWRfX9tfBZ2YtQ00+
 iiC2W3PjtzZXrIGIIm08zZo50iKhoD7G/jnRJxA8l1TvGmALMj4KNjy1asOu3bRmhXQhQZ2O/5Q
 HxHKAhXZ0+5cYOHXGYTmPq+/rWa9gUpFU8yF8FLy/wVS/2Jcg37riKAFboeXu6WaPw2edtjLvQV
 a683AU8boivBRc/mQSikG8h8QCkOXboIHE5IlfPgAvCyqXbYel9oUxjcKrjBRGXUlQq2IyqWiDl
 e/lcveTplP8M7smgBSYXU2Nmg8mTgiDPAbg2JFfRHlnqXQyGzM/rQKaoxSVjUC3Sld7AkRc919U
 /se6S98ugbSCjXDqnY9+yewe7AvmtGdcxj6vah2q+dOyyCjNNvMJd6ePZyhPKm02c5PhB+LeSM9
 JVnevbzhCCPGNqObRrNDNxR+WrMe/zh0FshLiVKVuS6BPQ/C3XregcGRimtXN0/izYwX3h/Vein
 tGBqQekSNnEoAGTYZIA==
X-Authority-Analysis: v=2.4 cv=TZmbdBQh c=1 sm=1 tr=0 ts=6982d4d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RFm3ULBN9CpRR-2xPD0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ElAPHZKnl9fPHd-A9ECfDSfEfg8Apnl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040035
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91769-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C730EE1D8D
X-Rspamd-Action: no action



On 2/3/2026 5:53 PM, Konrad Dybcio wrote:
> On 2/2/26 7:09 PM, Praveen Talari wrote:
>> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
>> the attachment of power domains. This often leads to duplicated code
>> logic across different driver probe functions.
>>
>> Introduce a new helper API, geni_se_domain_attach(), to centralize
>> the logic for attaching "power" and "perf" domains to the GENI SE
>> device.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int geni_se_domain_attach(struct geni_se *se)
>> +{
>> +	struct dev_pm_domain_attach_data pd_data = {
>> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
>> +		.pd_names = (const char*[]) { "power", "perf" },
>> +		.num_pd_names = 2,
>> +	};
>> +	int ret;
>> +
>> +	ret = dev_pm_domain_attach_list(se->dev,
>> +					&pd_data, &se->pd_list);
> 
> Let's use devm_pm_domain_attach_list() (notice the 'm'), as the list
> is never detached from at the moment

Sure, will add in next version.

Thanks,
Praveen Talari
> 
> otherwise lgtm
> 
> Konrad


