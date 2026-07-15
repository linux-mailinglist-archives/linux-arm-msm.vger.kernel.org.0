Return-Path: <linux-arm-msm+bounces-119178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F2OXHGs8V2qDHwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:53:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1675BA06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Sz+G2/VC";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=On5jnowc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119178-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119178-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 740433001A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691B236E46F;
	Wed, 15 Jul 2026 07:53:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C383C5DCD
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:53:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101988; cv=pass; b=nDn2xVPhL/3gxi1Xw96pCSeSLtg1HsFMyVtJFCtqw8uk7jthkBEzgyQDqvDM7kfaChNz8AfHt63BIOyaac5VIEIElaHgM6+lnRhl3MWX9m35EYxKCxWMuYULmhlFbQ/NdOe4j9ZYhPCwJbJSDQPeE8uMNW6sBvEzB71LRgKA+JQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101988; c=relaxed/simple;
	bh=9YX4dE+yfNDLsdJvZJbsFDglIGvjVkjjw2Mk4BuFTmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLT4ZmVd9vOLW/apKdh6Xz4YfZ1cRvtIDjsc1e78vMAhY/fM9ovwKc9QSZzK5NklLENW8P4vSULDjOrcTnV4XBpMcSn7Oe0m/qqjp+EK839BDebyVj2cCbsy/RBrRNrCx6jgLbOAf/umu3vzohIkaI4t6evmBneoPdkGZaOTHzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sz+G2/VC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=On5jnowc; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lC6I2405996
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=; b=Sz+G2/VCYAbYlEVg
	GWsJHKNm/x1ElQWVGvbElyl795HC6WCN4WOhRCllGM8MOAU9YVPnUWr8nfjcAj6i
	AfSomJ/oRUOA3Mpk3ehnz7XD8cWUfB+0uWBqAwm3idNoqVq1AmKS1wwbYXZGoOFr
	r3KTmwK91J9i6vmnou7C9BY4g2JzkWu0XEGw7BC13GwG8SLrMptnde32Ho1XXUGg
	XA+F/DEH3kkYbV9gzNSVNTxYbS8tG+fOBnscHcvIuEqpcfffLy2HYYhbUoiu8Vuq
	Vd7b2v6BncOCq6mdqgj3DU4gg6I21hUDnOF95n2wcQAb4eMkyvFISLWK1xBypWod
	pKDHNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g2kk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:53:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so711789185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784101981; cv=none;
        d=google.com; s=arc-20260327;
        b=Po4aYNyV9aoAIaMORFcPcETFOyFOjJaiIi7tGycKFaA0cnGwbLmB9G73xWRC67LR43
         LAzMdesi+DVwtL3JMxPAAVEkv+JyfLnsUQi+Bai13W7tqhbAohPmq7/LWW6CExAlslSZ
         wUcFUbCn+1HfjqUzHm02KOt/y4jG14RWj4PSckJ/vE+fES/Rtlf+SXyq/JB0/NN6AA74
         QQHVhhuWSE5CmLfMm6fSSaZR15tnGOlCliWUNGO4xmvoz75A6NBgRzBABiKjczMtztnR
         cEK6h6fPOlFNsASgEC/PTs3K9UFDkO/h/zHNKYZyd0imZlbGqifie5bn9Hje3aweirMa
         WQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        fh=VzVWc54PwEQZRRizvsA94lBAwlapvdTQhPiEPQpK5jM=;
        b=Ujke6UjrDtCEJN46vcUmcC6zGqzrN34Z9rEGlgM3rUv9En1ys8MAwSYOdXzxBdP8J0
         GzLT8gu0AmHjQ7y6RMsoxb9SGbSBAWOO9X7jRf0Xig0SZTvqnAOZHbatqP74SuyEq/iR
         qI11+uqfHWhqrfFXPFyzWpf5hp4ip+GY5A4xt0bbz60oShunyc/vKcoLQrzGHQdVnzQS
         brRrpUdy5FHbnVZmdGeEcJQu0O7BiOqd4YOUyB/NsjjLfuXMzR+AOE70aRL2ek80Qvab
         ueUwWL4rTrtWXT4/ZA9C52UO3Ua14xNoZxbAL4rCJ2PESgfSCblPMSrKul/f3kXdxwqQ
         +XVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101981; x=1784706781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=On5jnowcUAQW73FA5VrP3yxVX+/XHWlfM1SEUeBmnd1R8K4gYWN8ghzWSgDI7NIMMS
         Xgwj9HZkglErjevBoVEUaEivjtqUG8/QfmyTZM2Vonjk8OqDcwPfchFIT7jsLLbIuRCS
         dgIrA91vNAeBmEUygv/pCePQU6ucCwO7aD0SM7bpNAG+M2uC8LtUVtNtSDnavAARGRB4
         lqKT2sf3HK1d+JOwVJQs3nQONXcMgkp59O8KV7tP5593C4pjzB8An5cguWD/P4my6Zhk
         9Gr+JCw/dx89izTe89MK0Q9KYNBEF4G1WER0b1eNJDHekfz2eYhGnSfB85V6p1Ae2Wkh
         oCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101981; x=1784706781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=ZMGuAS3CNG4g9QCnS9OdzLIMW6zUQ/q65LNxPDtzFTcYtE+PmdqGg5hDC2zcXoSMIp
         Yh/aDtQvmxaWgHcP+Bt5K5hJDunPpgJAcw7naqtLFZhwbdLSZn4KniKnaPuwkp2W54WH
         DHkXwAz20axDYffiZE/v+5tSUeScYovXIuvEVlFbqAIJC8+eh0m/FqYo+MNPxvF1LPc6
         vPnNYBpVRt0XXAZA3jYOHB5S2M1YzF7uACqdZFbdvLzj0YkkqomeyZ/oCECZQEcrv2ys
         S8LPn8YkGSHFAMnVjT24ROBYvqwMOQaGH0PDMJqzq9NPpbgt3Zfx2frDYLT0asgslTIw
         l1PA==
X-Forwarded-Encrypted: i=1; AHgh+RrjZbQ7QTdDnJQgLUGdTRxFHdiSGOYkQA3dUmzRuytfyXhHO2X0r3s5Sbq2t9c1J6xD+h1fDyEmTJiWJJ+0@vger.kernel.org
X-Gm-Message-State: AOJu0YyQgv/0TEDi5n1WG6STLyc/9kF/1ONsLJRe5BdFRiL00+g4bPuu
	GRj9V2fXfUosWKb1KwhqA/aNmUojrIs3rtCQ6ChXD0uuBTwPjRgFo5Qv9bG7c5kBxn4Ijw+SY9j
	8uo3iQg3tNKsLox2jXR90Aoosv9OkwdvW7M7ahgBI9wPChfJaw5UvzhVOWtaEutZSy5A4Rc5uhM
	h9dsC5X3/D5Am1MVHdW19OK7c0lYCVpj4bXhkfu7bUWVk=
X-Gm-Gg: AfdE7cnFbaG4XfARJUa20FPXOcyf73cVEhvjXm9cryfcS1eoSre48rG2BlBkc9xYHoO
	6tddcbXY6wsu9BeMikXDl7+ar1lqdCO3pN1+mTWQyVf0VFCiLvDWffwdyZ5q0TFV/IqvuhRymXI
	cdnfP5Rz7gOJapdxwC62DCp2ETuN7Vx8X/PC2NNHG2Aio/BASPRy8wgkUhyPeaQveddXGpk8n3+
	Sd7P/PsHwpYleUYqxWDk4G5eZTWakPwlNxs9eFfAN41T1/wG3MdSjyG68nSlK6ayDbk0IYoa6uE
	kCqQOmKFnwk=
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id af79cd13be357-93086bea55cmr545859485a.56.1784101980996;
        Wed, 15 Jul 2026 00:53:00 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id
 af79cd13be357-93086bea55cmr545858585a.56.1784101980599; Wed, 15 Jul 2026
 00:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com> <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:52:48 +0200
X-Gm-Features: AUfX_mylGXRGoAJ8WLPXjHG-LrYjgeK28hgV3O_EXafPt2RbMf7pLiI-38KOrs0
Message-ID: <CAFEp6-3MrGLyTQ5+qaZ2nF=EWLgOhepTB41CwEEQZwJ6zQh8Rw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NCBTYWx0ZWRfX9vrzmpf/pE7l
 gPZ79q855v36P0s5/knuZ/S+dxyvD2BPiHrp30Gh4P1tmFDFAC4JoTkoF8kewzt1U7sMxQ0OXNF
 BMmV8TsHnqyDvgpSPnTebaLa7w0L5k8=
X-Proofpoint-ORIG-GUID: hVsPup40Lxr-40Jyda2dCrPq9nKgtMkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NCBTYWx0ZWRfXy6MW6p8Sc5FU
 DzJ/nxtssv+IAk9BEPFwdqZ82M55Z0bAz7lxQU1WUdl9wacHKNVEKiYWoI1FcER9IoPjZN0kHq/
 GMx3ILguOAKFIO1o1Af9MpVtQBtspqRWS1hJyfPrlcjRcKRxyRvsKdbE5QQrRD5q5WJkOEvZtL2
 6ked61tA6XwHcZsqum9K98QhmRhhtNQb7wcT41UUxWF8vRsGBXrapWWEyGBHuTSZJPhV5ldqUvk
 d7leKqv/YqSKDtucwhgOYqaoRchCVTH0B4eC+2wsUv2MKDFLiadThYgXV++4Qpi7ltEREB1DhX4
 dM0wdd6ivqqxF+x03k1Jrt125pvjPYpUDMYb02CtfZqD7vIx53yjIZ/E0quT5Qu5sAqSxdieLyl
 BiUPScBgR0GNN/DMjRwYAp2b43L5cE4AKaowFnDO3tJtwTSPboA20Qv8ZXQhQfeJgkWEbgujwro
 SDP8Laf17AK0jltueOA==
X-Proofpoint-GUID: hVsPup40Lxr-40Jyda2dCrPq9nKgtMkz
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a573c5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=U2PIo7JDszhCzVx53KgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119178-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65D1675BA06

On Mon, Jul 13, 2026 at 11:29=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eac=
eac796e342efd16 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
>                                 bias-disable;
>                         };
>
> +                       cci_i2c0_default: cci-i2c0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c0_sleep: cci-i2c0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci_i2c1_default: cci-i2c1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c1_sleep: cci-i2c1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
>                         sdc1_state_on: sdc1-on-state {
>                                 clk-pins {
>                                         pins =3D "sdc1_clk";
> @@ -702,6 +734,44 @@ port@1 {
>                                         reg =3D <1>;
>                                 };
>                         };
> +
> +               };
> +
> +               cci: cci@5c1b000 {
> +                       compatible =3D "qcom,shikra-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0x0 0x05c1b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 206 IRQ_TYPE_EDGE_RISING =
0>;
> +
> +                       clocks =3D <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                                <&gcc GCC_CAMSS_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci_i2c0_default &cci_i2c1_defaul=
t>;
> +                       pinctrl-1 =3D <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
>                 };
>
>                 qupv3_0: geniqup@4ac0000 {
>
> --
> 2.34.1
>

