Return-Path: <linux-arm-msm+bounces-97437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIFVFL3ss2m4dQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:53:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B585281C97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67F2F300BC84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669AD38E12B;
	Fri, 13 Mar 2026 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+1zqocn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibBQ/RpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F0838F641
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399222; cv=none; b=XHAmtCKhumhINt003GqWbzy2vNpjF5fOAqGHFuSyTODU3hxvPTNdldPNDFo5SVbIARjRt9J7RMUM5LzbCxuBQvFDVCVt575jx521r5JsvfI6fONzKPeW8YBGtckJXrgem8I67/trvx2EtylqTzT3pcLqsd4sBvO6yDDuw+hB4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399222; c=relaxed/simple;
	bh=PPCUfoI0/e/eDTBJyZ02tAh8FeidIqsgTPEkLr2KyZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ+vgBLiWoc3GjHliFMpqSWBEYHm39fA90RbQPhPy/OP0dXKnPnMGjIkkY/1imS5zuWnOy8z0HanEkEUX1vA3r90Aq+g497V9j3gaknvoWBOTM/rdbhwO9wXJLRXJZlXPELQgb32Ed5/YkqPWDZyuZGECAkxdGFMsKyLz74X4wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+1zqocn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibBQ/RpA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7mnu1749131
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX3xkJi/EXH6QWVgeE47LXXcq58/182R6seTgGT7pmo=; b=c+1zqocngVXoKfdq
	VjnLFbrPA0STiIAG7O6FVrox73LYbkYxBGijP27TfQSofRZ1CDLwiYBwwmrwM8QM
	E/MVyAJbQz/9bNtoiiONtBjmJL0lZ0TDfb3t4cBcntLeJDKveJ3Pta3aIQf2P8OF
	n0+64QYgZ+gfgU7wRhhR7L8WwR5QG2pMvFWX0A8fbAiRwmfBNaxiTg7p+Vs3F6yC
	jIZKt/3akiXIgSOROpzWpPNW5JZ5H7TyyiqvNAqtlXyrJK/UuuyO15DWmWdvyu/V
	9HuzohhwPfONkZJtE/aOzrw9eW43IyYjYLO7dusgZ7qpAGhguCKR+2ZHLmNUBK6S
	bb+Vxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6g4mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:53:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8dc8b434so126671885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773399219; x=1774004019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cX3xkJi/EXH6QWVgeE47LXXcq58/182R6seTgGT7pmo=;
        b=ibBQ/RpACoB06Kh0Bo9SShUK9desxiiRAZH9I+8PRgy4fnH9XVP/klFjvVl1TL20fN
         Pglwk1c3tIdSBOdR0iM9JI0GoZw/jFoUInkKveB9dBJyCW9jtotIAxbQMETzkft+Ij1G
         Z5ELemeP3x+Z1u6Ik61Gw0pTvckcY/UHkZvi5zSnJ4ZsO6OmEmBp0XO6GnRT0hyqC5Nv
         tg8e25/3eJbOkj6rMilJQqfIhSKO3ud5d7iqhmCgZHNmcN8dw9t6Ah3nfValgOlyEGan
         kh805IsHiqIhbnxOk9SB8a2wZ8SeiSXShLwAwZYrQFdjJIJ4bSZtGCnQ2w8vSoUfvQl+
         fzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399219; x=1774004019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX3xkJi/EXH6QWVgeE47LXXcq58/182R6seTgGT7pmo=;
        b=fGE8JeoT1VZAgkPUzQhnThAxURll+/xfgqfPP5H0ZkJEgGpLN4rUH9rVqb2qSdy3RN
         oHLYewuKUptUzhUi0FX6Dxxo8vu+NMy8Apdg9DMB6NP/i9mPZUFNs7suH0v32O0q2u0U
         kgmjMFFDmMPjD+VkN+BhW8eweKDFn4ukSAASGKTA6UHKYxl1et1gMktGjV0MSfIXRn3r
         oCT8gPJArAAuT0noMyg+GjnjbbcZO2AleeJkiCt4I5GZHxJon/i40ECfl0TRQq4eIwy0
         mdEw5pJbccZhL4bjGi3kGFmcXzweh4UJuHxFS7fQ2UBsggrQYKmgpGQPCKT6bApCt6DD
         LDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVWbKCla37qPNQN3SlG2DOZAddlq9zowwh5XB3F369NuYergIJL/2YC7Dl31QU0aFqbv5CNZNEhqiIiN7w@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjlG4PKVq/S34RHl1ehZDdP9W6yCprPwSgISCgSUbfTkx5eYO
	5WIP4z633fMn7HTNiyOYAobiD5uc2w0u5R80X57FE+y+mZ6TifjAMYceW01zaHrRZORQ8DCzvJc
	vNAdTExHDxgjwoQ3XC0vknIFhGJLTLyfOlJfPFKyNkvMF2Nt+SuYAKgdsbHaO4lpwl2hT
X-Gm-Gg: ATEYQzz9jvAuO/jsnGG7inzAET6681kBexTOAPjUO+CGwris9A3OZRSOPv/ylPh948O
	Yqk2ntMzOPhJ09/6NTIhvqr9E/Bgs8ugh6jD5m9CZ9L32D8HuuG2UD4ql4PeOY8qYbPKFQwvz6t
	Rn+cuBruS3fIEIALY3eB7CxVB9FyhK5QtBdHaWBYy3A3R0hLHm8L7EVkg16TKmBim2XLj8VdPQ6
	BEhJCQ1ZpnOPFFge4xjR1QA8crotkYIjn+D2WbFyPRcgwxoBivLKsnoh2dra+EBeTiYk+UPTO7E
	9c8ZOHxPRlmEQx7aj0nglTAHozVscy1ooeDxapbFsM46qDXVtI5+IcNS7OqBulOLxiZbnp5zP2R
	fOr4AubB4Sy/2kpyqz/tRdjDY0dschgIi2AIyXE58Upv2uaPf+4x9bENxY5lvXyihiIHE4TiZw1
	qtVT4=
X-Received: by 2002:a05:620a:710c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cdb5b61aacmr277701885a.6.1773399219367;
        Fri, 13 Mar 2026 03:53:39 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cdb5b61aacmr277700585a.6.1773399219002;
        Fri, 13 Mar 2026 03:53:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf3db5asm36817866b.56.2026.03.13.03.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:53:38 -0700 (PDT)
Message-ID: <36da7262-0dda-4bb1-b9f2-abd77ef83730@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:53:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: camcc-sc8180x: Add missing HW_CTRL
 GDSC flag
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-11-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312112321.370983-11-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NSBTYWx0ZWRfX4KJYLNIFpj4t
 Sr10o3OHe8mN3q9ePVvdHhv/1dlxxs1CWT6VW8KgStRvIpsF/eSbkLtOlb8qrmKlwJ3/iyz8t2N
 NJOf3GdTJhlHfQzN+2rky7VqCdREOALgIeebCu0MLl8hhWmMcipe2xwEJRf1y1bRIGg3WJloTT5
 +Uoev/quIfAp5OA51YU9ILihFqvW9F7QZ2ZWc49SrlJ94eghkRDoI54sERmVQYKd0PFCFe5b/oC
 Tq4/9rrPY90yoFN8pCVcgZkdQyFdg7aOZoegkl8d0OVhErXi9MLQsTWBm2DaACBpcm45Ew3XwKB
 FIPctEsDpLQ9D9sV4n93pjI/+K/75V6fkaNh2mYvAot72x/lZZs2uW12DHzrvBF0QY3RNRzvbqZ
 /yLsQnsNn41eZQuR/6tn6lBS0JZNAhg0FqzUFfCMok8ZJRYgBOFM4I+kAkBqWmRO6GQ8rX7MDSP
 YkxpG9O2PIRNjtuST0g==
X-Proofpoint-GUID: 9mFE_s6s7OJxUhptBsh07_Nt5xpOMxXJ
X-Proofpoint-ORIG-GUID: 9mFE_s6s7OJxUhptBsh07_Nt5xpOMxXJ
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b3ecb4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ysDSEWaLRDX8un34YhAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97437-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B585281C97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:12 PM, Val Packett wrote:
> In all other Qualcomm SoC camcc drivers, the BPS and IPE GDSCs use the
> HW_CTRL flag, but it was missing on SC8180X.
> 
> Fix by setting it on all applicable GDSC entries.
> 
> Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/camcc-sc8180x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
> index cd4c40a81c28..67b2055bd212 100644
> --- a/drivers/clk/qcom/camcc-sc8180x.c
> +++ b/drivers/clk/qcom/camcc-sc8180x.c
> @@ -2555,7 +2555,7 @@ static struct gdsc bps_gdsc = {
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.parent = &titan_top_gdsc.pd,
> -	.flags = POLL_CFG_GDSCR,
> +	.flags = HW_CTRL | POLL_CFG_GDSCR,

FWIW downstream seems to use HW_MODE at runtime and SW_MODE+collapse on
suspend for both BPS and IPE, so perhaps HW_CTRL_TRIGGER (and a patch to
the driver) would be better suited

Konrad

