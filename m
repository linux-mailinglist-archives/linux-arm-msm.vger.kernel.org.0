Return-Path: <linux-arm-msm+bounces-92115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIreEZMDh2mpSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:19:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0981054EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2C3F3003BCC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 09:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E203C3019B2;
	Sat,  7 Feb 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJboHJmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imx9Y3Sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE932E92B3
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455950; cv=none; b=qHgXA9VnL8JotpN6eT7eqUVpObRO6xABn3ZxyhOVp0u+ZL2zcBL/b5fyocp7+91SROXZRyn9Q7DitgRxSn5/DkddUyXbkdcWCQ9B486ohqNPgZiSoqDPJcIh9kQnqZ6h7HYZLAnNBOKvCXl2nve+6UN2lYo9jVNH51bGDRRiCY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455950; c=relaxed/simple;
	bh=DDF7P37GUvWF77NFQmoJPtnpWBxrXc6+qGMn0YAvKlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nl84oiZl5r8w1jze3D4d96pjZOQpBUeMeNjz/rW4CjHnlJDfIFeMIY+DIo6hlp9BicQOEbpauqoY+QM2DPpm4Kg5gF1mIEOSvfe0N94+v74OfqxLhyymYA3igWTjDHLlc9HkG/X/1LcHTTfFLzyZIK4OeH0CVjXszzQvkzs9ojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJboHJmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imx9Y3Sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6177bdHQ2117358
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 09:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YUonyW6a557wLmzLM1XA/ZQe
	RIm/x19FFkubBMJmca8=; b=KJboHJmwQtyQem8OlCKj0BQmLrJHRo9p0va/kWW/
	ZASWELckndJ+kYDeJPW5cUvHxCW5cq6XT6YtwSkD5NloQbYn6G+WlkZRYjeGp/eM
	5meIpeGjnDIzuwJixApOUhqMyn+W7lhfrGqUV20WthaL8ltavGQVzbrLCHBJLZon
	0hRv1TeIut628eTkHKt3rwrcgT/LeHEXlbo6KVjbOgxLAhLIev1tY8og3GFJ2WXJ
	K1vosSaPpw2X6YbKnGSynAijkMct67mt6Izal4N+d3+muvtuAN6HyXlum7ywZjT3
	dwyaKuZbOuBZQZdMeGMuTKZkp8qwtUU6CIZAaG2YbrI1bw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xbf8dqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 09:19:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so843362785a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770455949; x=1771060749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUonyW6a557wLmzLM1XA/ZQeRIm/x19FFkubBMJmca8=;
        b=imx9Y3ScYXGraYXX0zVE4wUSJXO58Sxf452RhoXtODZzfTcvsCQSNRuELMAQCuirDX
         ok99HV2NJhNIF5u7xE2RuwMCqaT7XPLHnpk29yGU013KeZfNellKuIPGohGeXoB48ZfY
         3a/L6L/BLY7yjL3Ol9WSyzNH+MJfeUvwPRjob7cQC9b7PCW+rbFbkQb/F7KtIDSNHh6T
         sQ7W+f32FzMw959FRQLyLKBD/cTdFXuuySDbPdxtuFjy4gFpGBZ0Kb9EuWBKEMSfGN/W
         a51W138qCmNZGcPZs2lYWbi4X7K+2yLX102P7Cjh+Z/D0f+MN2l5e2V5/DTrCrSt22pe
         +sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455949; x=1771060749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUonyW6a557wLmzLM1XA/ZQeRIm/x19FFkubBMJmca8=;
        b=v0FskdcmcQ2QHnIFphO587mH56odq8sz484vzp9lfeaAdR1A2+SqVKwcWUNlniVMaN
         z9IW99kmPKbwskc2XoXW4+sBiufp893oubIt3j4Gp4UvysyC+grovL6TTqTxMXIO86AX
         JDbQkGypOjy6T1ySxd1d0DHiwFi2U81ynjctM9KHnRwG2OPvoLsU8ZZxKBIUWCZ6mfb2
         VavTEonuC4vYKzNarCYdfgyCRtc2ipxPg7RrufEHvi1R00/rgn9qieiBFAyArwIeCLEY
         SnXiRQsHtKMox7BjA3G3Uma4huCQUYcqXsqj1abIHDdDfooSE28ZpGS/8JlAMfF2fk/0
         tN+g==
X-Forwarded-Encrypted: i=1; AJvYcCV4ci4HRvo/mRbniYNAZQmAL5usMm0FsXasrQwMgVYLlx67YJTrjwb1hA02il0vnzCgS9rM+wUJ9uaJRfeG@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWh4b7++ZCzNcJdeDZmEJxhDKatfc0XCueKi0O4rie1B/3HmD
	+JIwLHiZqLs/5kCxyaXTSERpZRB3N/e3EjzpXlLXASnppkUAGVw9dFepjN0qkzvm4mH+2lt2wAc
	QKJV6FTjSMqY6U/wwPOZrx7ZhWsO+0FTeQoZJ8BdYIWAAlqMmsBZWhLIcrR5g77yBkLzQ
X-Gm-Gg: AZuq6aK9LQbPLooJDgNuu5G0KGsJ5P/6gl1ygVjx16QHuRFoE6Lwf1gV2XQ4V8ICIdq
	XAYCHhwYwlBxikwIzsCCxOmZu4ZvDp8zbYksaEQFONM8f5rt1ruWtklm+0mXnmR9+BCwCGUsVJs
	l3fwzqNWUj5oPSvrZ7MINVvE8Q5yFp3rzhj7jqm7c7Fsx4bCbV+ekcH62CD5YwGNjqxb6iYynki
	ZvM3VMksaEwqz5Jgl2Z2FRYZqNhNzOn0ZpltoDbuEF3lEEmew4vKS3uwmv7dCZv9BctUlMS88Tr
	znbmhjBICvcA05Gub4LxgkOzggyZ2HKOrcLrXDy5QYNwjMT7BZlIBQB/IcE1+esy/eib053E/q0
	IGtg6PqTf8c/XOmTEbJDM6ocq6G9OLviX276y/paz1OzcqFG0tlPraOym8BGS3qVATJkJRxgLgO
	YiQHAPHzqcTCz2If/P5tQLCR4=
X-Received: by 2002:a05:620a:2982:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8caf15efe18mr649693285a.74.1770455949103;
        Sat, 07 Feb 2026 01:19:09 -0800 (PST)
X-Received: by 2002:a05:620a:2982:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8caf15efe18mr649691585a.74.1770455948662;
        Sat, 07 Feb 2026 01:19:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6e8fsm1179017e87.9.2026.02.07.01.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:19:08 -0800 (PST)
Date: Sat, 7 Feb 2026 11:19:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
Message-ID: <jloqgua3e2lub2daplqlie6fhrsxntwepfwoa5csxdababstib@lp7b2uy3jqos>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sNJbIRMNjPdvqLSMJkLvDcO244oBA2_m
X-Proofpoint-GUID: sNJbIRMNjPdvqLSMJkLvDcO244oBA2_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MiBTYWx0ZWRfXxEfkFUoLxtlr
 yiVbBmp7MvjNiVFY9Zo05kg8lCnT+qei11IkPNOatwgghaXqxuet9sNB5i3uWUV1WNU/aJl9CKn
 ZySWf8mznr4G9B5NpBGBt7VPflq2J7IHn/wvSOMdqwb70Jc07alSf693TV/49RrhMFAVv5QEZ+8
 CquQkZWP2gQy7MRwdmFm0L0hYUrkuAQ5+GElbgSMBhNdihgGHy7zkFDEXIUUFwsNx0xWr55olPD
 xpCYGt+d5WExfFfGneA52gm7QN4X8kR9wPzGI/70VkIFoZ3tj5qDjE2v0kjlLsh/4NXpAKazy4e
 Z+0BASDbH2sGThhK0/stSdNQ6JpI/rE0JLtt7rBbLs5gctJ786XEGzkCZ2T3MpovO3JUubABYfQ
 WIMdcnloiL/kwdeX89yOeRkok+uasVJhkWExMH7Ve+ND0j3aTHm7Cxeah+R9S+ygm541QNMl7SV
 nYi5TgFoBSbptlDsSyQ==
X-Authority-Analysis: v=2.4 cv=aIb9aL9m c=1 sm=1 tr=0 ts=6987038d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=h-dCiIZhG8S0YCyILTQA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92115-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F0981054EA
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:14:07PM -0500, Srinivas Kandagatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Qualcomm platforms support the Senary MI2S interface for audio playback

What is Senary MI2S?

> and capture. Add a new definitions for the Senary MI2S RX and TX ports,
> which are required for boards that utilize the Senary MI2S interface
> for audio routing.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 0febc641f351..715bcf1bccdd 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -150,7 +150,9 @@
>  #define	LPI_MI2S_TX_3		144
>  #define	LPI_MI2S_RX_4		145
>  #define	LPI_MI2S_TX_4		146
> -#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
> +#define	SENARY_MI2S_RX		147
> +#define	SENARY_MI2S_TX		148
> +#define	LPASS_MAX_PORT		(SENARY_MI2S_TX + 1)
>  
>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>  #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry

