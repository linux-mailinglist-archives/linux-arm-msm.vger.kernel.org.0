Return-Path: <linux-arm-msm+bounces-101639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCDcN32uz2kjzQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:11:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4112393F2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 14:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A66930459D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 12:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FF93254B2;
	Fri,  3 Apr 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCGsIgkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lz7+NRwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E444821A447
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 12:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775218184; cv=none; b=iz7+YWZdLTnatP0OYwCa85SD2uAKXPtgYlUu2M11fWBrptM0cI0Ok6/p7EWXZTYymlmTxPpAX4Lx5K6alX3tF7vnNd73JKL9fCH1r4hH5DfVJOmp2VkPFUlOHmksQH/eSwVXObTuTOa7UawGhWGjwfCcgwwlUFL4PNvmyxAQJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775218184; c=relaxed/simple;
	bh=wUvYtpcs9XNXiIywZhnee2IHx7izMalzhE0a0QgnWPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikQGD+1wp4Tj14s4JRTrNep2h+WZfvziXWFtJYQ1Igt5fmxw1lQkCeXKJ16cPJ1bGmhOkV5wr51+68Wz7FN1qsqAzXvA9406lvtSxSj4ZwJRiHI2ZVIpZxoV2+l8FH7SSCrU/cq+HVOvkpt3Zittk0UTMZvlya4jKpewIzEKeHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCGsIgkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lz7+NRwK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AxE713803308
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 12:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gnl4sM8zA20ARfyeKrrxmcEGAhdUZgBxsvgJlrjFmX4=; b=fCGsIgkDcCodoe+b
	Yh36nTZM0Dq1mw1ztTRv4pZObZb3EzLfuoOkHDkC58M4oBZUfql0fliOJCFg1E0S
	tQpQq8PYEK/uVEqWKC5f7GgGa3K0RszzBffppzf6tfUAjDhY3lDR0f5VR9MCE/rG
	JJfqEl60aOfZ56QEOWfQ6OF6o3jNfowCCBAhz3KaM4TEFhNXeyNEuaW1F+ZKY/4b
	2xbmRQyEDNHHi40r3eACaAGdTp/DbWI1780Q5U4eeEejJovTf2EMMCQibnH/84+e
	Povq8LK+VK0HuJrC1ZNqfkKvABRaNdeUmwgydTtjPB501mJ+F5A8sO9rfP8RN2cb
	4idRuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f85b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:09:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242f76113so20849305ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 05:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775218183; x=1775822983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gnl4sM8zA20ARfyeKrrxmcEGAhdUZgBxsvgJlrjFmX4=;
        b=Lz7+NRwKrxXwENrDvGRpgqRiXEmgPKVuvv9WXZumkPbQDSxFnqLJb9C73/jhjBtRqF
         Zs1cJC20DmfBKFZxxGJN6rzKwHOpDd4VsFEUiQFicNp0zymbzd+YT3lNo+of9/tbjsy+
         Atyr8lEapvjetre2Hv3bKQgdB0q8Jd09Yf6ybluTtbW/g/6IwaVZ733PXP0sXDGL5H7h
         uKmvNBTbTdb4y3XAAbcEWzioNT7myAe2zmnnaVgPcjU0YqR3W2IuOyO1HYTK12xy4sog
         JLZlBvpEg1rtCGJhpBPo07iRLsFupFLjiO19u3fzg2RTgqcn38INMrClwxUALS9bc5sg
         diSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775218183; x=1775822983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnl4sM8zA20ARfyeKrrxmcEGAhdUZgBxsvgJlrjFmX4=;
        b=mrolGTwyHVFaRcSmBdVaEhmZ4YpQd/nR9EVnMschaatlFz1G+Z0ziBCaxdlFpxQbnr
         PA4fgo1wvYDxy9J/prkju0k8+tEndvHUs9EDbDASYU57V6NoAJC0y50pwiCEIljos5xG
         GYgAs6TGtgB+v3mWPb1luiXXP+t9iQ8hz2Q0xB2abwJmAooz8lx4Nly1LA73f37waz9G
         RCmq2hTzyCHqLvx9DopT74nrMvYhjLg6TnCHkwHy9uqLh1okAJKS2COee6Jzk5lj9G7P
         gklgepvWGqbQ2DQzjiP8Xa7vrVcuwsmW9HkzcAXkkmS3TjN1iY0swUEz6EDdGEMotwjg
         0zVA==
X-Forwarded-Encrypted: i=1; AJvYcCVPVUJlfha+hWS8GdvSewHrq6GvL1SENgGKixK8Ma4VMYwNmJ/7Yg0iuYCeTQrRjyuWmCmOv3VCl3reEEUF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+YWtUuvziIA4csLT08tsfX2uWbzeC/XLNoKn0UzSZOYKP5qWI
	RB5toRz+xWLzccsfY7ohLMhr3YUNF0btBXUNSkXvPPl+W2uPkKQqJlxco1yYA9NTkau7bx6p4Vp
	/5e68PIzkhgrG6SoIKQClVBmbwPcEi6yHwV7mz5XnPmvawHYo3nq6bbn29spaXCemtJuy
X-Gm-Gg: AeBDieuf80ZIUo7jnYCLOVg7AUps5iniOwEnHnPz1Pey3kPEc22+x/fcnLv/JIKVDNI
	RQDCtMxis3Asix/MEyJRymSu3mpWX2+44k2fsysjwUpU1Jmaq0rO2jwUlxFelRRaftyUCg1h0fc
	BQXl+Fap7TpabIAhs/GOvbGTmhKG2RZQmFHK/6gly34V8UzpKYpcPEKPCzPh8SnEiKjXuUrtyNy
	Z2RTWS/bPJ3EtafDiRrIE8Ipqoj1NkDLwKE+27Hyh6DbSiaEEci3Y8pN9asI5VcMl0wXWFUlN2Q
	CstQla6twrgc3HB7q5lJLmJWsbdr0vyenMcxOPxQ/DRvPUz+nrwhr4i/5Gr81foyNl98Nqdxh35
	PyHfaMGikin0jtCsfOotEPYEzuZpYzywmpmbwwJKmHO01RP6vtEDi
X-Received: by 2002:a17:902:cec6:b0:2b0:b290:f302 with SMTP id d9443c01a7336-2b2818de0femr34019255ad.35.1775218182661;
        Fri, 03 Apr 2026 05:09:42 -0700 (PDT)
X-Received: by 2002:a17:902:cec6:b0:2b0:b290:f302 with SMTP id d9443c01a7336-2b2818de0femr34018995ad.35.1775218182201;
        Fri, 03 Apr 2026 05:09:42 -0700 (PDT)
Received: from [10.92.199.249] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979500sm76740915ad.44.2026.04.03.05.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 05:09:41 -0700 (PDT)
Message-ID: <0543815f-a7ee-420e-a4c4-9f4dc2848bbc@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:39:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: host: sdhci-msm: Fix the wrapped key handling
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, adrian.hunter@intel.com,
        ebiggers@kernel.org, abel.vesa@linaro.org, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e-8u6yPky_nu4oGR-UYdVvMMkRYxIgsr
X-Proofpoint-ORIG-GUID: e-8u6yPky_nu4oGR-UYdVvMMkRYxIgsr
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69cfae07 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=agS0TBrbGMSRRrU0JjAA:9 a=QEXdDO2ut3YA:10 a=UzISIztuOb4A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEwOCBTYWx0ZWRfX5HMWG+g4/bQK
 1sSf29jBpizdrQE6ECh7WyHhX/H0LIA/EKch3L2kAv534fbDp6a/pHwMlq9cWjHTjjaf5Vw+Q6i
 43QQY6o8XlPNcAsTF+F2gWcIWhea/fxWDRfi24IU7dKZn2be91hlRPvhrJvZSqW2krdcPX3EN7O
 1k8tV2MrhRxzDhaQqLms5GJN00khn1O3Fy4nOIhJTL+qHtiI9z000V1PLX2caR02E0/mxfuDqNb
 m8AGMOXXhrnDg4NPV7FcZYfLcBRM+CilOp1jT99/a9rSImjPX+0P7/m/VGJix9xx8gO6G+1zfmi
 FWAAINL+TfqjXqoP3uH5L+0XDet5FGqXdWUZT9rfVVl8Q6fCoG29pmSZxYWZbQAHAQgYNa5IvaU
 R2Sv5AB/QRJzgsb2eejaxx//IWTbS2zMyc4SSZIVfl6BBmFN1KRBz7O3GW0F88jphIQoYwyr8Ua
 8eLEtR133RszlRgzJ4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030108
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101639-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4112393F2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 4:29 PM, Neeraj Soni wrote:
> This change was originally intended to land with the patch series:
> "mmc: host: sdhci-msm: Add support for wrapped keys". The fix was present
> till v4 but was accidentally dropped in v5 while rebasing.
> 

Seems you need Fixes: tag to address the fix on the merged change.

-- 
Regards
Kuldeep


