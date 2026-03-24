Return-Path: <linux-arm-msm+bounces-99624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMqTAoNuwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:59:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF30306E55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8350A30F4702
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2D93E4C7D;
	Tue, 24 Mar 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeuqvSy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjICwdaK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758F13E7142
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349517; cv=none; b=bzMUr5R7Dkk36+eTLXidzwqpNoL58zDSKFGy89fQsPqdxLVkae0P0Ob9/qusZay7fuhp7y86iGQ8yZmlbfHA2Z9KU6ddcGEVRAHn80oMxjG0BPmMCduhNjHPSn11pUmqCWf7hWoH0QamfVO9O4nHPDPXkEaS+ofw2Mnxvf3LaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349517; c=relaxed/simple;
	bh=uGwTmKa4v5Dw85aNF7uhD/mce5JoECBrz2IShLy26x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLec7oF4JL5LFusiBLIWBhc9zFkgjR4YqTt5c1J19HXrWT65gQI5wEasPYLcmWPGNtyGJKqKnPr60GhNg2EnoSm5Kxyb57cZVuAaFmlsZSkQBp4i7Tbze0yy8Z8pEqYLAXgXkH97yLyOQoUdjrRFRuYlzQ3ziAovK0E7EllhqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeuqvSy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjICwdaK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7RBx32371345
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pD0Hi98G9iC6oDoEHGu63b0DHmtoy8/a4b1bdtIh8ec=; b=GeuqvSy6u8XgWG3f
	REAeZ7yYWhZ1c0ZM57TpwkUQJJVDCribOFSnTLo91pQGKPE7bT07/gtwepd29pEw
	jkZiwwtprrASgLOpCV5Qtf9Ify2Blcxm9YrT+Yf1+e0q+xntxJjxX9dK2erNxP1T
	vx6ZaymawYnTfhi2pKv+tlpfjczWT5pPhtk7j09R++2qaz68by2CGAkvxgmomkb8
	jCyr96WETxzSo4cj2pR4ju6a4DVzggtrFdXv+cMqL9GrEB16k+jpxetqmV7FaxH5
	zVi6+0gZp5W2VjFCZU8TpiFpd8s8oaGfr5oQYdu599uV1f8IZ0VT6S+RYTxQH2o+
	Vj2kSw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830qt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:51:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b2d5e61f6so31783521cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349514; x=1774954314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pD0Hi98G9iC6oDoEHGu63b0DHmtoy8/a4b1bdtIh8ec=;
        b=CjICwdaKIELFkJpy6ffengaUcYJfamC0av91fO9yMT+BOVSzeJnssdfLx7qeRLzgbt
         viOlqkv0QtkHoOc/Kh8d7L5PU5+wYlGTP9K/tZ6dYKp3VIpNopQCucGrCZUXpLLQhIGy
         Kb4QeSFM50mlhB/DkgiKq19DBttkG8ZiuzZVbDuwn+V3dh0qNJL65cCLnJ7hkVypGUlJ
         jBOVHpsFTcbbhWnLq/IxBhFfUDAoEf7jwq4JfOcoCZTy/O+QNxLFwzmYKqH2DqHL7MK4
         pdzekuSoaxEqo1OgAVJJ3vShgDBOLCyfpArGD/7Yq3blAkDBjV9WNukBQSWo5rqzLSXP
         yMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349514; x=1774954314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD0Hi98G9iC6oDoEHGu63b0DHmtoy8/a4b1bdtIh8ec=;
        b=sk6JQw6yCp7XYOn/5Cp8gH2erDqyrWgeCGj4Um7YzvAHCogB7P+eZbkX8f6lqGoLud
         IsvZkzO3olktYHSUqf6Vd1EPVpd4HTFYEgiwSLnYfEUuKwe8MnA8dnWLIfzA+Rvlz3v5
         wISyIlbvYwZGG2rtKfH8zUqmFV53+BKkCELLMZLD2p5/4OBh55zAd1tTvmHniDwZDnHc
         GF1bXE+xcnyiukD771ZHjTXiKwKKcuusOgKWyrlJOsGTlNNui5cgNLPiiN6zSbLY5L76
         wuUSpL2DHDdNnBhhxeYerqFTT40fGUGTaVa2HidQPLxOXq6CD1ccpV8ZX0rJFMOUvAXr
         lujw==
X-Gm-Message-State: AOJu0Ywjo8X7BrJl7+tvg5dC2r21dAa9ROc1l9w9zvrBXV8S6qVDB2Ty
	BDp3d9OkA3GlDvgt2NXI/c5iPyTORVDFbwWQljdGMiT2hbeCjbwdkCGVlbe33usvGQDKWgcUOIb
	lrmhAXE5KhbC+TGoKhdQsikhpbXGyLzqwRsltb2JT/F3hPOb4/FOTioHox6yQTSAYzO7Q
X-Gm-Gg: ATEYQzxEqDDVXm+gOTlXnAbN4+LBokSEqzEjzLUMLla9wtEMwxSWDFVXw/Jv316342I
	TtHCo2yyo/wDpL/KEaOK3BSFEz8WOA7GvGImHl1wtevdtfi0LcqTsDry+NgAtvBeR1h8WbAspjj
	RecQDvbI71HqK39Z4xLei19UlCwXE0kk8Lpg4W3it8iNDAgThxgoWLHrtzYTyE+vkol5bcCu9Ow
	5j6djexA7ZMIuLPK5W1XGuBx7/uI8XE1FMd7YeatNfZcufAo/LTcR4eBqSSo1Gc6sa5VF79mOPt
	rRCT4rS92qb+Ez+gWAPf3ZfLBMU8gwlHnis3oAQtHN94tqDoF1qq9iKwoOg1HXhPZhlXOA/jdDV
	BsnjtPBBGR8ZRQCQhyaYbiAnCiL2sDBMyyKa1nDNTEExdB/ugfewri78huQ5fQZar9Nhc6f91Gh
	8tUIQ=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr194549871cf.1.1774349513868;
        Tue, 24 Mar 2026 03:51:53 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr194549541cf.1.1774349513260;
        Tue, 24 Mar 2026 03:51:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dff5sm618765966b.24.2026.03.24.03.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:51:52 -0700 (PDT)
Message-ID: <76f6f90f-794c-4fd1-80ed-63416626a54d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:51:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-7-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-7-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX8xGCtQ/ogFwj
 LNnCnNg7m/jJ8R2JYSCVc4V6GZZ3gexlIzzlchBzLJvQS769yC5/wh0OgjjdQ3KtMZv1kd+m0Ge
 NGwMv/vzvq1HsMxQPyXM6DEz6ZpRiCm6LEBUnTJMcRfSVPjuuqLQf7CL2ivfc287f86YhOVFwwJ
 KxRee/jsuyL83wveBe9Bm+1yjtu9klOKnBFQSAY8ZFFakpV0jc7ZainZieK0RQEM0B7fS3NAYzM
 KF65c7FggUe7xxSEheP5FCk2i6snd+c2Cjgc/mAvpfEFD87LpZFeiAEqrSxzuKEJ5F+y42901tt
 RYSak4FAftUMhs3S9hL7ux1B9lNs54ml7pG2/ggOR8BZV50SHMZFsy7pJJxGkxpO23fmY2D9/go
 aS1j39p3zh462FVD+a3kCjdFUzyllH1y+Dzd16ZJsuz0n3YxYW4l/uEHARKn7I4jx4jHze9Zlwp
 Af/lTaa58f2DxgE+BFg==
X-Proofpoint-ORIG-GUID: qFb1FLNrBAukwYAEK8JYCMp1wemUcUEm
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c26cca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=yndPCfnnJPvdZL5cpNsA:9 a=QEXdDO2ut3YA:10
 a=IQdlk4_VRkkA:10 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: qFb1FLNrBAukwYAEK8JYCMp1wemUcUEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	TAGGED_FROM(0.00)[bounces-99624-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BF30306E55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:06 AM, Paul Sajna wrote:
> These regulators are required for the LCD
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

