Return-Path: <linux-arm-msm+bounces-99096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIhYKSHIwGk4KwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 05:57:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8412EC8E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 05:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89C743007F58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 04:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D429DB9A;
	Mon, 23 Mar 2026 04:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YM5YjciN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJOcUvMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1329AB05
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241823; cv=none; b=Jc+LBmThVYxV501FLVlkQhyNQlkdIaYTBhJA4UCkHeXby3+q00JuTthdmRCNGj5h3ppBXaJLqDNrCbw54wShHY2Rl9VZpdLsLB0/lILG8CRVEQlb25WpHyhAScogqsHaWIqp8TUTZoh+jKZkNhExow7SGBGBuH2VCYL0KtBV3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241823; c=relaxed/simple;
	bh=6wDGojsAdut4A5NmPLDITN8to0kwBKtdzXHZOpQJPNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cyEhnSHihjcHkQt6+q3GIoe7XEOaljzMxV2t/X3x8Ef6C2rBL7OWHY4S3hE60IEOxPZvUol4tDjzX5HDhjhiyxxKWjPJz1sk/bUk4c4pGB1FosAYmaHLPPhtHS/UlOCJeDZDCMavaEAUt6lGguR0Uu3OKJk77LfI0fJ1lTlG4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YM5YjciN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJOcUvMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N3Qapb2489750
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svL94WkWhXuPQIoF5tegtkrM8CC32bZrLcQvS4N+uWQ=; b=YM5YjciNbAXslme8
	B1sOI0Q0YItGUPPAfFXvDlHalQRTTH7MjRcYk96OlVAunGEI4jrYbZnC33zkaNlT
	yh/NFVKnFdvetjAJA98zl3L+2CguTKiWUmOG9G/tIk8ZKIFt30VvIhS0vPTbHURX
	CM4XpB0K2X69/qGzvTnf0OByFTc4a1IgnV2x36BJCCNkBnZmCphPU1jcsAWvG4y0
	7HmMdlF42s1yqxik+zjA3Fk+wLVRY7MN4M3V1eTpNzQ1tuZ7mAThrt2N2y2T2qQN
	eFCQmOakyBP/VaOtqIN68v4Qcykph0+FP1MUYkOXDIJHXLhGmV9XM20lHcCDE8Bq
	Ra3cxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk3y22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:57:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aecbb78e44so190556195ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 21:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774241820; x=1774846620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svL94WkWhXuPQIoF5tegtkrM8CC32bZrLcQvS4N+uWQ=;
        b=JJOcUvMb6CmiIrIZqz8NdgjhqzBQHkJ4X9XlH5FUw9ujXrrA0TyZ0D1nZm7BFkU+PY
         zaXqFaS4Od2DkEW3BcgjhnASReCHIMgaYHEM2o6Db7nH22v/LXSJWjP1gIaUP3rMgtj2
         JIYDw6elmxWHDUHOkIlIy36a7eyXwxe+1eQeF+WWzh0lUKZyYblulYSqa0vmyb+PdVve
         qxc5E79Oa9Ghoh34M623rYEn7Xl8V+GezPrPuXEFF8hYJ5JRgAGwZJo0qDYsrufPPUEW
         X4nw+HXtjyWsRXnEvcCqVnhh34+zauSYJ8tAtcoIVwXD3mm1QpHvINZp1V+yM/+GBeuB
         lPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774241820; x=1774846620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svL94WkWhXuPQIoF5tegtkrM8CC32bZrLcQvS4N+uWQ=;
        b=Fe9IOttcpralU7tnEi2eKp3IQVqSWc4+VDNd4+yz6Lg/ju6EEJbHpOHS8trTs8HU/t
         eZNJVR9PkdB4skuUmRn5/IhbKB5uqREVQ5JOc9kdVvrm7c1orumz+50womvhjBOza+bZ
         b/baxkXLsnVgXiA7vS8nB432J23G6k7eRcVKIlehfKlBgRrKsgHuT77C7yFYAZFwQtSp
         sGGE5lWcoE/Nk/A8DRKlge2DTV3p6Va3jIS6/XTin0k4PEguJescoAUfF49PIytcKBfH
         GDuVO1OB8mzxHQATf7s9KiVpy8kDhVCjAM0G/dtkUOy5PLkIG0L4rZ+fClwOxKT+/bru
         t8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXbuWv8lCVusi5mZdhAZBWi5kq3q19XocHn0MDjgwIRvB/CLYrb0cu5OFQdMGFTZBN1pWxz3nir5VyINQqW@vger.kernel.org
X-Gm-Message-State: AOJu0YyPNoh7LC6Bf+Ny0XjX/n0OYJTe4AdKa4gJIWBt8a5zlYO4amIx
	SscNN2qzbNjBbOrTMJhseYYmt8psB+CzKyNY+BOB3ZhhyBmbZixlgV8eRdvT9cOLQSievT+fvuU
	oiqwPQU+0ko0PKaLPPkhzbjmlaRxN4TeFhRdZA6WLJkP/kdWSumYsAu2B1qwqT1gXT0iG
X-Gm-Gg: ATEYQzxQh6MS7hcfVSfor6VLiU+NmUbCpuGoqKstAFqG6MpeN9Rjlwbc9mEL+tXxB88
	Ksq4j9pQA0WXvUMcG1YDbYO1Pi5psiVs+SP4k2nKXF3sRam6xTdHYKlEnvZfyVrIETaKIu97g7b
	f95AmwHegaidF9yG2jlCHpCFlm6Ps5i+bjtIAt6fsbnYQGVwefAZ4zUmCXUxu1C9nZVkUyEgAbB
	w6dLQCiWrbBA/13LPKDVWQ6phxr+L5XPLmLYV4/o/fazPqDfxv0D7mF5VOJ6iAtY0Z+PfLuP9eY
	o846ytlVDiGgcLepn1TAMZcT18krDASyMw0yzFpLx2tN59i5smuaieiBnzjPx6FRtkDD8KQZE7q
	iPo8dR3rPZegfqp9m1aT33rTWdDrFrMwu1rEINUz37ziBGrw6CHXcfQ==
X-Received: by 2002:a17:903:1c3:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b091e6c1a3mr48097295ad.51.1774241819708;
        Sun, 22 Mar 2026 21:56:59 -0700 (PDT)
X-Received: by 2002:a17:903:1c3:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b091e6c1a3mr48097075ad.51.1774241819250;
        Sun, 22 Mar 2026 21:56:59 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c56bsm127732255ad.57.2026.03.22.21.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:56:58 -0700 (PDT)
Message-ID: <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:26:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
 <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0V0BsRa-XYcAOB8xrtu51w-5nBI1PEwF
X-Proofpoint-GUID: 0V0BsRa-XYcAOB8xrtu51w-5nBI1PEwF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAzNSBTYWx0ZWRfXwNFYkC52TALP
 Wv3J8WhsY2+gOYd3G8pfCjx5hucyWoHQwzW3+zlzGWbqAbTtguw3hRnD4EVQjc3G7A51zc+qprT
 6YL3MfZpcx0zahFY2OBJy+OYVHJ2zxa1gHlkzK2kIBk+bWd+qOAhFedK0Gx0CLBkTa9pjiIj+KG
 u/UdlcxUlddFtvv9F77lZs7H3hA6pdx4D+A2sYuSyJw+A9nZ1aRmnwpcE8Ov0iSmnotnaXDge7m
 yKAEfgcfgrtiQXidaoSlTAXFtvavsi8Cz2+GUGJVQ78ds6RdIZdWEBQHRqPXWhSKTDgNseKN9dN
 GV/B6YxnCJg48a1MWms/v6lBh9C0TgGsnv7Vfnx/xF+IYBZE43lOZ0KHIuRIygl6Iiboa4Bvv8o
 LkVEvUYL4rri7xMfLzOL738CxP6uYWwP7STXtLetLlA5Ht0xtK4CQmNALjDQe/uk+h1+x1tiGEc
 fdjTACeTVLml3KvRPMQ==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69c0c81c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=F-3G6NKJkSEc1uAqM64A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99096-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF8412EC8E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/16/2026 6:26 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
>> Keep GCC USB QTB clock always ON which is required for SMMU
>> invalidation on X1E80100 platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
>> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
>> --- a/drivers/clk/qcom/gcc-x1e80100.c
>> +++ b/drivers/clk/qcom/gcc-x1e80100.c
>> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
>>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
>>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
>>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
> 
> Is it used during all SMMU invalidations or only for those related to
> the USB controller?
> 

Yes, it is required for all SMMU invalidations.

Thanks,
Jagadeesh

>>  
>>  	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
>>  	regmap_write(regmap, 0x52224, 0x0);
>>
>> ---
>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>> change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
>>
>> Best regards,
>> -- 
>> Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>
> 


