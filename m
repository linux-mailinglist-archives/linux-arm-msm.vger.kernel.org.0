Return-Path: <linux-arm-msm+bounces-91411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJFEHW1DgGnW5QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:25:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C556BC8A23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73081300B9C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0F82F618B;
	Mon,  2 Feb 2026 06:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fE1pfskX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHci5IdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F52BD015
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013547; cv=none; b=ehHSYFpe/IQcq2FVERGXrqhUZ/5xh400sd88+3jjCBLu42vqGQSoWOT75NBA+2twyJUaqaoxirT1v2XUhlktnoHXtZdnRAyN/tCCTvLYtgZS2S0uIVWtQNUIlUPoaTCQwdLfLy+/jaCJFPJQf5JIM6Ee4jLT+uZICoFXFYmYvtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013547; c=relaxed/simple;
	bh=QKQCQun2Iyzdg0FisykOBDaXIMlnhHY6tZJM+5iysK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sB9Y+Nex3zByjP4PXzl/tSIQtkpIflQiqqNA6xbdJNy6DL3zwOMxbIhAQLcabCQzLl62WCPOpWUV9mPHXM4DrdWPt7LkhK8bU2A2GmhKsdbkhzS0f2s4JAgxzwaSe8kIkfT5grImkIP1rWFJ/m+q90tIGomTYx//Eaw0HEzEJ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fE1pfskX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHci5IdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611NK1v31191778
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbHVOMvWwq1SBsaVyz83Aw+1xfSO9+RoZ6AzrtEPWns=; b=fE1pfskXCQtd2tMJ
	gIzGvNvJ07Z524BuCiIKgQwnpIZAhvTS8ZbJlEA6cDxHSwXe2eH2NHrK1WcCg4U7
	pUG1/5rrXADwkdHDY0BoAjA/NDPl3u7va7GXv0r3eKQN+VNV9OiMOCpl5HEiSAgc
	vddAcblQc1kKvd4tlSmaZRWUQWmKkSnQqXrodlX9G5xYmnmlJ9+t9P99lzXCLOQX
	nX7B7hS2tXhConth5zTBwopdbGIYNcvhlEj9X8Ob4UB1eA5Zpid78DdhKdvzwmtY
	sLnVSnFhAZO3t9+M144Pr0yayaKD5GWoU5zYT9r3lQa0nJ51PoOjHBCNk7ky1eLG
	B5+xbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as4v72w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:25:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a79164b686so42007905ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770013544; x=1770618344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbHVOMvWwq1SBsaVyz83Aw+1xfSO9+RoZ6AzrtEPWns=;
        b=OHci5IdUolR6hyf0139Al0EiwDUKBf1AnI60xmzEn5GRn5DTp/T9Mnt4TXLjFvpeXk
         h77JRABR2RdIObLbJ8Dwj1gCmwVqFIyESsV5iMagoO/KioxVMZX0NSLGSqA5kZFl+0wX
         jNJDTjVbMJPfgoxWNM/K8Bq+2eMs0Z8ohqT0RgpMOcQqAQFA6rrl3/XZtVWOy0yVNPFc
         wrk0CcsAS7Z+AuRJU7d1Ux+rdqPE236gbaOfB5UNFtpk06YZvCv++HYzc+H47rQJOApG
         M/1xU20Pf/r0GDZAMip3YivD/ODbm5Q8BOi3vZTLqarjTXbHT+Zt2/dIkFW6IOQX5I8/
         yRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013544; x=1770618344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbHVOMvWwq1SBsaVyz83Aw+1xfSO9+RoZ6AzrtEPWns=;
        b=PTjqXnletL2bKlML1oGWztxmQi9/OebLbYk9IIvJT6/Ckbb9z9YLHuLsXkpQmzlFQe
         hhSBXBGh1BMGtpSHmtCuaeMyB8nu+tKw4PRB5qI+WB1aegxYqvKZxkSzvpItMD0b4aDu
         KSpJlbF+kq2oyy9CslyqxDuiK++h48il+VY+8DXocpApK3MOPzSn1MVOzIAXw6lg8KzS
         Z8WdlQy0F5TXP3LrtbKUYEMatJx6aljxObpIdsruh2ecXO0nhCG8ywOywkUXsxo97Ouy
         N2Hvn2DZTLbP18pQXXfYuUdIYXxLUGY7XoxNaPTgpNzyNF5CAQiNt7ySj16Lgqq67VPQ
         bKgg==
X-Forwarded-Encrypted: i=1; AJvYcCXZmUXLo6S516kID7Zx1XBLvz8k3/0o9KNcHY/GZDt8mC76rupi8JaKEsxE+U2idR6BGTi7LaDF4IUSINun@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7MaFCsdqcyM1kIvoc3YGcd4VXS1JYNEz2F9RWc0VHIsTIrlB
	w7x43wTeEd9WbslqdGpbjpbItbep+p7/RLRGz4ZYeN7CcwfqIPWEXSlIxqxNVIPD1KnIUi1+R2B
	D/27jSurepe3ikUSUN1siim8TMOxGLfZqmFcTanDRY78G2t1zyGz9dDqRThg7QYJkVDt4
X-Gm-Gg: AZuq6aJLDMQhtOn8Wh+bhbO68c2KtjrNjhhIUcEwlf98FTlnEVab0EOqJOzSqwKCkZl
	XPIvD5A637wxDLeuq71RXNgh9W1YsEwjUsxKVKW+VT0hxHITEsbSEabh40zZPNFm5hwS9DzdYPF
	FeA+fLKwD6tcaQL2yaKOTOYTs1JSnGXok/qeKiF4+N7Pntiv4cBCfT4vEvsMVLkivMXqvEbjsl9
	FHYpQiSRlvZru8CN+rSF1e9bF9dIov7v7fU9+Cqw9jyHE6U/+w7HANq+4Ij/vQFMBmhm5yquAHU
	r8ILw/C/caBPj74fU/yQTUcYUQ23RxKoUhFzfxv84gOV3qqG4373jGjuGbMDd0CvpACHIW++KEy
	G2dqg0dcRUQqRVkgapt7Fi7u0iLG8tPk7vl3RGe9hjf9N
X-Received: by 2002:a17:902:fc8d:b0:2a0:f47c:cfc with SMTP id d9443c01a7336-2a8d990b3e5mr96544165ad.34.1770013544379;
        Sun, 01 Feb 2026 22:25:44 -0800 (PST)
X-Received: by 2002:a17:902:fc8d:b0:2a0:f47c:cfc with SMTP id d9443c01a7336-2a8d990b3e5mr96543955ad.34.1770013543851;
        Sun, 01 Feb 2026 22:25:43 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b41390bsm132917265ad.23.2026.02.01.22.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:25:43 -0800 (PST)
Message-ID: <151807c1-9a91-448a-9cb2-01c799890378@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/5] media: qcom: venus: flip the venus/iris switch
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-5-e10b886771e1@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-5-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BaES84aYidGbOXfH2bp80NsfJWH2yZ0L
X-Proofpoint-GUID: BaES84aYidGbOXfH2bp80NsfJWH2yZ0L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1MyBTYWx0ZWRfX/2yRtscy6/hZ
 5HzEI8E8OaS9Bv75JPsfuzZ36Xs9AO5EoIQGeA/yUQcPGeiT7WVbZBGakDvmzjAGBI4cfs7Oq9S
 sfh+pPk2T8TyzQUUyRu5AJYEMhlslMIrL9WFZA3yWeqfyYTCJM6JhDuRQlpaqOuyjSTDBL/NfUn
 0f/6Uz2JMSZwENKExQ1gibeof6XGnYAkGpFs2Q5abOvozGG97XPyMVKpCKLXtfcE+ZnLFRTyGpN
 eIT43s8/qFoRaKHjiEVzyWawzxvLivWqExgJcfwuptlb3pL4lXuN38mIiTAczfderp1XHVUa0Fd
 bw/bA2iEudQMEUvrZpaOmQ7fOhGHLzOKg1SBR1+9OtTZGyvvwCNS9PDAbRXQsKwEqjry0WNn/IQ
 bHY96ybZlvvwSsw6dyEzd03ftQw5wBg2GBlVbBPwsSXFxW9g8E+C6+2Eh2SDHizSRC5MmWd6mvf
 yWDEqpGKkOSMUS8P0aA==
X-Authority-Analysis: v=2.4 cv=bIEb4f+Z c=1 sm=1 tr=0 ts=69804369 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jz17cmUFc4N99GX7AB4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91411-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C556BC8A23
X-Rspamd-Action: no action



On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile     |  5 +----
>  drivers/media/platform/qcom/iris/iris_probe.c |  2 --
>  drivers/media/platform/qcom/venus/core.c      |  6 ++++++
>  drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
>  4 files changed, 18 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

