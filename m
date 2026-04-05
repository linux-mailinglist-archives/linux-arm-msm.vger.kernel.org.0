Return-Path: <linux-arm-msm+bounces-101857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKpjNHJm0mnMXQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:41:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 322BA39E963
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 15:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33439301BCF4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 13:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888C634678C;
	Sun,  5 Apr 2026 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GI/PKmzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6UJS8qT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3595C34752B
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775396401; cv=none; b=mrXMzf75V1l5bpOqA0zZNU1oCOo7GFfUca95zQo+YoklYYKi5tOTWX8yq5jGNp/NB4NF/dH2HjG9n5uMy9cNB+/IruvE071hqTSOMquujVZ83fQLUdudZ3rRyOcFmSa5s+XF1e6m9hB5WlHx/zb3A4CQTFZa4nAX1HHM5mGSIAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775396401; c=relaxed/simple;
	bh=zP1Q725C2gVijBM7MKdyaN85O1+n289G4MfeoCP0jj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4jg4Osk1yUYvovBLCl0ZPaQDQr5hxThQ39DjxvRhxrLf09KbCq1kJEGUWLuxx8KToGLw43epqBbke0VRZBZuLF8n4CZkU68a0FUcKTNsS+QnPr4cCPu09i1F4NApdvlT1l1CCazz6PM9ZYOCoslz6nFm+gGlUz3i/mlksSEi+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GI/PKmzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6UJS8qT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JHE0o3771838
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Apr 2026 13:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzDFJDdRx7HeV1kbNfklWcvzdM3qIlnSGSbecBYvve0=; b=GI/PKmzbKiprI3dF
	7A42xmHR4YWwk+HOqWcd5ZUCjdQuCodQ80wH9Xbix2j1IUAPqalnlvb43CQTU5Ps
	ZaDXG++6VmyKLghglPQSPF1KVOC9t0r7DHM3g0EEPpVHW+5LSyb8dj1gP3mSTtHX
	id4inS27xhcAwTtE7zpcRxpDJc7GybLF9/QUfpozJ5KY7KhYpIOqiQECW3qNyMLc
	8aM07uZGz/7Tudwh4+nbIaROSEi3YZqtBB7ZlWiU/jCvshlyVC4lLu7ExV38jXT5
	8wem/ArHQqiaEAySj3C7/S8tWDqsJ8RUWjc9+VNZCaoNGhO4BxNTSZAtyjDjWAaI
	L2RD2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1ahfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 13:39:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so70315931cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775396399; x=1776001199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzDFJDdRx7HeV1kbNfklWcvzdM3qIlnSGSbecBYvve0=;
        b=Y6UJS8qTpFyBLYD5XrEuedW73XNzz7OF2TBChVKBhsp1cQpQ3fhTLvX43pOSnbJ1gq
         DJ6InuXH6v4Xz8sH/DPssubzYZ7bM47/Q/CsL7sgyBV62e6wWkTQRCnbSQsjFUhdQ9KZ
         Ql1VitQRRJj9gvMn+Nn0Clj3xc23N/JjKD++lz8nndoLQBOzMxAQ082f4fTBLQ6s/l/8
         84nRNkihaewCi0xI+UZ2xZWc/l+KtXw5SjaNTc30JJHHXNEyCxXgEhLJrogaoV5uz63r
         ksAP3RqBO07emC3YEGqrTj9y/ihhfvkBEtn24jinDOX2D1FTP/qjq1NOepR9Hm5QGhOz
         RUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775396399; x=1776001199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzDFJDdRx7HeV1kbNfklWcvzdM3qIlnSGSbecBYvve0=;
        b=k/JNQsq3/zL38OnqFinSjqJhcrysn9NM4cRRVUdrwTNYC4WeUvkQzGPHugPXwoPYCH
         ntHhUTXEKYZU7j4BrlVANO/2rfZT5+2aATHwBH4tdwNS4277vWK+IYFxG3wclS1hIU3L
         8FStqM/gThVOOOEB1Hs74MZLDy8eH2uworEs1jqjzh4lLSgLYOHIbvMYjU8loCPBSiYk
         WOwnH6NSms7A9XsQy2Uq/O5cIazuaH7gYc7LaSANkJiIqFwQ1dhBrtbGmyM8E6BIdmkd
         8YHnISOWrARSbeZLpsP1FOpz4QJktRNTsMzX2F/4whDM9I6pnc9ZaFC5urdz2eC3yQjK
         qKcA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3iZbndWPN5dDjknT1SQ3RbV91XVhk55eZIXQ7vIF55IGCS0GG8iAy03mffJ+KtKMq5ikhm8zJghe75Ah@vger.kernel.org
X-Gm-Message-State: AOJu0YzkvBH8gWqIdt/LBRkm91+dghLPCajsdB231AvyqBef68VJyyve
	QIl5E7y/Z9MxJCKm19OjfDISrMipQnhq/P/R75wShPBq1CZ9+CSLBLhM8nHgAHbn4u9I/GPJDbv
	q+5awncIixMNt3NqnreyDdRwEhSr8na1GR6RoxFfaeTsgT13mmR4IofaMpm1ar+jMRXIq
X-Gm-Gg: AeBDiesm7l72UTJMMtzDLxJYJ1/vxzFLwHhjci+/8caXaOn3dv169V0pS4e5Nv3wJ+7
	TWYyitvfocgWTwPVfYTbZq6HkniCBCCCmzXEDZsVeKKGl5bpLIqLd51etrsls2kGhHYTubmgqX1
	gWovB+MMmn6FEFoUdPwGPEkTMR2mDOEt4r65UC/aQomfr6q0bgaRRdknHxpTGQHKbKz896zII+i
	N3fRMqZk3XG/wjI7apoJ/gpA7TfGT7yShLJFaGuhDwgln6XtDLFemeca16dmuPXnygriJ6HhLMJ
	kQNl7U2Ql1G1FfTOqnwr6C+yLT+eZ2yiHoP/OTK0whmWACnA02+FOEXFx0B3iRMwPLNpkII72+/
	9748j03FQjcijOd3zPDsu25yh95Vh56Z0/jXdJKxwVnLm
X-Received: by 2002:a05:622a:5518:b0:50d:770f:ad1a with SMTP id d75a77b69052e-50d770fb032mr80726491cf.37.1775396398764;
        Sun, 05 Apr 2026 06:39:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5518:b0:50d:770f:ad1a with SMTP id d75a77b69052e-50d770fb032mr80726101cf.37.1775396398291;
        Sun, 05 Apr 2026 06:39:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm32188774f8f.2.2026.04.05.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:39:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 15:39:30 +0200
Subject: [PATCH v2 3/5] arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg
 warnings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-w-1-fixes-v2-3-1f2c7b74a93f@oss.qualcomm.com>
References: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-w-1-fixes-v2-0-1f2c7b74a93f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zP1Q725C2gVijBM7MKdyaN85O1+n289G4MfeoCP0jj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0mYgmZqGi2JR3L2yIBObdvtnqrq5bc9QvNvpc
 vbO2xC6Eh+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJmIAAKCRDBN2bmhouD
 146OD/9ZyOZve25Xfvsli2OWmA4Pqp1eGWT5w0p04PtaPs/fW5F+RlJuFHtSzBPM7AAlCF8Ug2s
 vSIO62d3N2idfP+c2ckkaFZgIJLhudNKr0adkaKMwPoxGIvp7egolLhrbp8tWMrFgeI5InINrkJ
 Hh78sT2u7US5htEqAXk3rmmD0+chC77qfCvB///i/D19+IERQHQBG3fWz8yZIJ0j2R3YiVpeKXC
 xT+rc4AczhcMaBXqx1sMt5sPDgim9tbYsvpAfdNDLwd0qALwF4L/CrCRzRTZPuOBoAOLXl5AA4f
 QgIW72JKauqDe+tZCLyPP2TpMGMe8isPbQ0ge2QfKG8rBIgDfAxKOeoN/KHiGr82fojIbw396Y6
 tCkM5Sul+egQpYwXEPZnyqHEKl8VheAYsWWM7BnE3POJa5SYLjhkzHXUDZN+ww1+YhCHBHrX2AL
 A128zc2Kvua7JR6pw4bIwTnU356gvbPOfdjdc4jyFi3SZCDnZ8sf3X57GzoU4f0BbrW5aWnUG3Z
 CABOnw0ut8fu3hxdBZhq2C8JhM6Y3TXYiwE4WAUomt/3tp/Zfw9Zln7brSwuEmUgkaoue28gPg9
 KEZWn9zEma6yeUIGmAizEpy0myXoJsUbnuPq6wnYesaJRDOJfQxPgapHWlCn7sV2vZ1zOOc3Fdx
 IKpJm0Hjoz/Me/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: VY7hvjFuI7rPidL7NslFmdOJiV4WpB0z
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d2662f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mXL7kWYZv1q9rXQNpRkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VY7hvjFuI7rPidL7NslFmdOJiV4WpB0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE0MCBTYWx0ZWRfX/skecce18Omi
 UbH89HhSCJeHDpJM9a/hVz6Zz59b91kShD84mgKYFQKjtY6MzBUGUpMOy+0k53oNJfCk4X+AMaM
 dUbPsko7L5rLXRo2S1ZjMcMBZptcRtI2hAcUB5nb3D7pzys2eZvP1vXTB9+q4gIHkkoDAAGuDkh
 88OU4VUkWw0E0N1fo/gANxb5LNREUXBZbvFFv1HJtW3b8Y5QqU22WCq7WnNJvbZOTHUn0Kcvmhg
 vjRFFXbLvC7rFTFJ7mQi1Ofek6ZuDIDoP9BKDu4lM7IJ2SMkIo8jj2Y8dp6IwsUKcfJFE7VotvT
 sGzvLqiKSKJzPTVVL7neAt9nrW1uSnJEubfOLG37XVWa/b0M9SrNrxhKCrlSsGmnGwuQIPzoSiq
 jWfCKEwDnRgkQq7e8NCpZqediD4dRjez7KHBIGv9XXgN1vSA5EHT4QGCKVUMqn3TjzdAG/kctgB
 QhMvS0DBLgYFe+bdwEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050140
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
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101857-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[7d000:email,0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,1e00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 322BA39E963
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the unit address of USB nodes in Qualcomm IPQ5424 SoC DTSI to
fix W=1 DTC warnings:

  ipq5424.dtsi:642.22-693.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
  ipq5424.dtsi:733.22-786.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"

Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index f20cda429094..876bf6a8b8ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -639,7 +639,7 @@ qusb_phy_1: phy@71000 {
 			status = "disabled";
 		};
 
-		usb2: usb2@1e00000 {
+		usb2: usb2@1ef8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x01ef8800 0 0x400>;
 			#address-cells = <2>;
@@ -730,7 +730,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		usb3: usb3@8a00000 {
+		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;
 

-- 
2.51.0


