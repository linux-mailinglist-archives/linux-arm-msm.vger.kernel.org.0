Return-Path: <linux-arm-msm+bounces-99649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLowA3GHwmkAegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:45:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A963088CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 609A630C4E0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE873FB065;
	Tue, 24 Mar 2026 12:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9Ea1L76";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUbOl3AO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278DE3FB054
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355787; cv=none; b=p63l85H1JVXfbsgWDbSTYVw/T/CM/1VtQsLsOYUYC1eOgXdfisKob3OMnEl7UGbzoak4uaggtH0OYAtQzrYsDrMPoD+r+21l7mZ3l9YP2p1SPfl7b9InIhYzv5yD7B6q0434SnS4v7X/EE/4z7iOzN/muqk4eKt1zFmVc+bxQx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355787; c=relaxed/simple;
	bh=l8KXVrTAkDzLuVlRAvJMWH6n6KoadC8nbAt6Phd2Ro4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsTw5FW1l1RHt7sgErmVLXhRLKwZzYx5AH9zNAsA5GUvZsSAtBeBNEj9LsZDqan0WkYnEG5XegKB8xE+daj9iKZAWvj4RkSsEiwB8s6Um6jFNBp3w2AFTEPqS0h0t7LBphxu7QjlPBWtOe41eUhMtOs9oMnwDxXzx7cizpypmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9Ea1L76; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUbOl3AO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC38sl1817278
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BMrbOK5sv+fvRDt5IDBBbr6qfYE+gH4iheNqDAD1m70=; b=W9Ea1L76rgcrkLmN
	qZkob5y6loXsHYm2NijQgakMU6w1Hgsjs7tHPanecO+0+6D3uk4VDFP0p1uaKjB9
	OABw+cCzMjMrzgq9jk5snQebjB0KMbQRYYBjCv2bS9vnML50ZOSHE2Bt+j3MZPgB
	B8A2b1u8d+rZFOC9CaR6COwtFqP3dI6FRki+G6Qj69oH+hGkOAXDmLnst39VvcZo
	WlvHPdIwhknkbznBR2CqSiXIT6sEMe7AJdL+C3yJxFM6TW+YamEbm/n3PHGS/Kfo
	4muH6F3A7M6yCNrLbyqGjxDeKCu5yNSEH3ldF4AxyaM6GVhbsR6R+4drWMKd6YVY
	BwtmAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9eg572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:36:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2a1f123fso35874961cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774355784; x=1774960584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMrbOK5sv+fvRDt5IDBBbr6qfYE+gH4iheNqDAD1m70=;
        b=SUbOl3AO9QUoNpW5Mri5r3AjTEhmPiUHbgwJRZMgmC2SUARSopdfvp9Nk+lxlIv0Sl
         EpGAE/M8Zv7rAFKwtKpY73puqXCUwaLEdT/syJtsTl7yVh/LXa/Np/R1OQ1MdL75/5mD
         6O/wTXTarSljhgl3vjg1W3HACpUdOEV0XQrVNYAns9QSzUrWBwV5INu39J9Tuhpkz6Hf
         lK/QBWfreXRhCRpdFSMzD1TCXBcz0ZAuXhbUMQ18fnzK457jQcquDdwdq5yMZwsUZVGS
         ALn2nAgiFUa4WPj+LtBRW0hnwTTTsqI6KMLE7A+8tS2xoigiybrALotialGTVjvpN0hM
         Jxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355784; x=1774960584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMrbOK5sv+fvRDt5IDBBbr6qfYE+gH4iheNqDAD1m70=;
        b=OZ/ldGTEci5Yq+cCXLs0883Nk8v8cUZdCevBjRO/A2UF90g8L1cWS/o3t029/J+FCp
         QTwDc+FDpsnGi66W4KXUfU0nmIuqICJ55HCccPq6blhB2iF0VJncDm/M/+gxFsmgERW9
         suX/4uCUsQrB8EXTiergMLS3dHmFsSgY5GFPkl4WC+1G7hVlOu9wxYI7L2Zs5B+T9HHC
         xFwx01MzOGMWcJDGR7riHoblXzQ2Z6rVKvNSOmdEEhxmsRx8jzgvM7AsOQ1P4WkZuEkr
         w7WVYyvasD3pYr9kbtp4gmybVEEIZCAf2N9gS75Axn6fPA/layMd9tnkrS3CtrbSjcbY
         Qwzw==
X-Gm-Message-State: AOJu0YyKsuwc8pgT4Y+eWjXRwFY2N69GiTq0pENGWTukMuiGVIBRkz+z
	QuhG1S5wqDr7WrBe9hzMLA9lQA2n3OJqPp37YhF6sFkEzd+KSp2C4PoXEhqqfRWJFTEHF8MVWiZ
	GKTj6pPaDvWM16sarErKdwGW1xy3QOVB5i10SKw86lGtPZAzqiz+Qfb7d77Dsa2cpgjKp
X-Gm-Gg: ATEYQzwfArl46p1LCg1E4JlK66cKxTZd0i/WKSkwBPePMT/wPNxuw/VZ2S20cW7rpJT
	Jd0dD1nUMSqTVlSaOZC4GUfimt+WJe506U23NaQ2Kc4jKLf8FodkKre/ULQRZSg26+YDVFBFRi8
	l26oJAXaexf1BLfS+UzpXtxO3CZLjJ22KuInERrTSp/a6MvtWAOuwdqPvzVotHsOW3razfnBmzc
	oUV0itR4bTYy/DXqcrXbBys0FGbIhExy2OAF86STN6gSgdALZUt1w0+JXxdObDg6PlU8jlkkECz
	86vVMkpXszb7fZ0JHd+SjLyvTJwsIyRqhi+lQM6R5eIycjdXP/ODqXcERb88js7GzFCzsM6MQlV
	2YCH/uBsAIMIWiZGlVtoEK9WlHuhEm6+G9Abr2b1KUAaasF58GVKChMyGSCRRafh5O3GmmSaMg0
	sWXYE=
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr73980871cf.9.1774355784202;
        Tue, 24 Mar 2026 05:36:24 -0700 (PDT)
X-Received: by 2002:a05:622a:6788:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b50758e93mr73980721cf.9.1774355783755;
        Tue, 24 Mar 2026 05:36:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a14csm614764266b.43.2026.03.24.05.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:36:22 -0700 (PDT)
Message-ID: <12b2fd16-2429-4838-a709-a6fb6268c0c3@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 13:36:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add AYN Odin 2 Portal
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-5-33a8ac3d53fa@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-ayn-qcs8550-v4-5-33a8ac3d53fa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bvm92Gqs0v_BrZdVmJET0EB9b1RSnrpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMCBTYWx0ZWRfXwfiubxxow4Mn
 oWJ70kPsLMD5aLLN9YHWWebUbnbEq53RwK3x6Xw4DoDD3fR0MQxKzwbjj+lD7VtOT9YbIJST2rl
 Wuq9AP0gFEChgtqJOFVODYPIPjCRClg8S9PKpiPO2LxZocm57tE4FYcfndVbRSSNV2BvzGjaHr4
 EahQ3o53iV8ZrozjLAXdVS4pLZlHXsmMbjFti7k706mwUNi61FjfgD9hLD/QQoWVHHwbyVaAIEE
 ssytHZI0OHRqhHjMNx8qhdnZ4bIkI7I/H0uNFn9xvXbnk1GwcuFRgjk0gmyC8sx4wRv7rcNRTtc
 z3WKklFRmzozsXBxH7+eQfmsxTgtaSq5tRceLBP3OzOL61qVO4deDc5rWVxZBkKAs3MWO942v+e
 mmMF5rmhE3mZEO5pR+zhEa6DxFz8sMkdvmYp9s82fhk0B1X8JK2DugJWNbzXOIm1DfdXOj1ffze
 nMJxNviC4GH9ZKSlgZA==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c28549 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4PMlgOObqc5rzRHRgksA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bvm92Gqs0v_BrZdVmJET0EB9b1RSnrpf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-99649-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sobir.in:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0A963088CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Odin 2 Portal is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 7-inch OLED touchscreen.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

