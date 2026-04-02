Return-Path: <linux-arm-msm+bounces-101538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEwkEyRYzmkxnAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:51:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881BB388931
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7F4D307B20D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F613D812D;
	Thu,  2 Apr 2026 11:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgokJVDY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQpJfiLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DFF35E94F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130345; cv=none; b=PDqMVRKN3JjmvPg46j3CtqChCz0BY98OLCBjLQk/8Ky0AKf6wl+SibW0EV+LQFus/S4n7/JLPaLBApIaJGfJIw/H2SvynD8z4+aV99+rqRPDagmHh3DWNIQPGp5K527Gj/ngh2jRoBGjcklAMMy2agCrfF35sVQJEcA+ioZZTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130345; c=relaxed/simple;
	bh=3Z2/9UqtEtBsglgzBaJ0JiBgZ+BcLHLqDj6g4rOOZYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDOlJgLBERy9r6OE5khIdzAMpXeinz1veqdeFIHF9WLATWP1ZKTNcKOxBw8g6HJ+CPJtTX2VH5cJ0Q4Iilc/XFJXcZyBggxElQDbcY3P6PUzn0AbKxjN22iPJc+pU9D80q3YV3jB8CuiMvyfcl9RRQ/PKkpEBOh+MYa78lIQs0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgokJVDY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQpJfiLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632A5qno1551326
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbW2GVtQLECICNbCJchxxSpZYBY6WOf1KNIaA4QN208=; b=jgokJVDYQEz7Wzk/
	VIEYiLLDapJbvJ0uje0/7KfvbQB+MVo5XwEodF4FWNdq3hsZ/i0LML1SYzamalF4
	Vn/hbl7nQ4w7AHatMek8M5rD1qeyOY2IvGJf8fvJtwCXJ7si1d9Fv9q9ZA4bJC6+
	q28WhuOYYnnSLrhOhXOMj0bNYtrFtKuUmjEn2qkUbvgELZZ10NIlvmuNlvkR6H9+
	9p9dtfCGDz75rNn56Jlb/qx6dvIvuVciKRKaXHkmiPCY3s+D/g77uFbio4Lnd68d
	R2oIsJiID+779qQIivETkencA2mpYg6a0CLpLYBaUVywEchmazpU+k1enLT+aYA2
	g3Rz6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heess80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso19706821cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130330; x=1775735130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbW2GVtQLECICNbCJchxxSpZYBY6WOf1KNIaA4QN208=;
        b=IQpJfiLZ3xa6VFxt68ZXaynx89Z2rpkmAEYzUarKZlhk/2b6UAijhf6yzJaMKgoHXT
         25xqiA0Orizc82m51N9LGmWyxJgfTi+jl2ejrKcBcV9SMlfZU+OXXrghp0lL2zoziX9z
         ljjUBC7Lo62zaS7k9ziOhDza1lfpaHw+0fXbbY5SIlXWIhlBsMVdK1+1hCDh5h/X05w/
         Ze42lk9xGYb70+Vu/z8vazCM+oAdqeCHPoINMglAlVK2SemQw3VhEbykHO2UECTGhYSc
         Xzel1FnUu2vKzhjvHFKWOd+ZYorPJlu0DJAyhmSqjZIYVggZCD1PPi7R/JmOovh6avs7
         9TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130330; x=1775735130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hbW2GVtQLECICNbCJchxxSpZYBY6WOf1KNIaA4QN208=;
        b=kUGdkaxgpdFFtx+BIqIBonhoo8t7nYQamdx3TjP+trV8axeqfgRcd6Z5XUcJGMVkjv
         U+TMu8knGTjuqlAvQych2RAr39u71nLmwm9qaNtIpau21CegP60uhAZdjrNJlnHdfGRx
         h6YCgJu2el1FkMGb4qAvcCzlSuoZhpoDcHXtnBNFukHYZMkWYUJXCqf2aLF2JRev2feR
         MqKcUlVfa+EevVQfhmRxuZbmKUETThdC5Z/nN4KMxCoVM5Jf9aafQSMSWforbm9NejJE
         P5CYNdi+YfK8gPpj5J/bBeDFzMz1i86V4RZF9vJQHqUu6hwsY9rxIQVma/DtkeU9TtJj
         Dx4w==
X-Gm-Message-State: AOJu0Yw82aLhI6MKMLdNhan1aNzwlH2CpgrFes8WcBQrhUw6Ebc9I0XW
	cx0X9L8xUryeFAEGNF0/yDTXxUa5mXBodidduHpTBD2cHlJcr3FeNexPT0F9KpGJsaGsI7ouC40
	27Oj4Gv7kDNAJmdvHD/g39VxPgtYOzeEm2uAdsG6YLfKgyqkeYwPediFU4TwZNdr9y8M4gYJrZ1
	xS
X-Gm-Gg: ATEYQzzp/ZDUUFQz0xnP9kk4DISZSKYNoNfgOpx1p0wuQ69/SZdjp6Suwpn09Pjj8qO
	JmsLrAoupZ5ntSRlCfKSHxBBHm/JIryFAQCCj+aRRBUcKCtMjF8NhqPXpKwBg4ri+vkFJvwYKSB
	76KPQ570UF7pkPDg2XeoHsxuq/KfnELS3p5ctPTSr4PNzOzw7b1Q9reALvhADkX+eFDyzFxb6qp
	9QldE8+0OkoxnNXIkw1vMCXLA6NAF+GYv3itt8UA+HEDZJuoVyBHsTQ/YFr3QTzOwZNaxSkE605
	MaDn8HRZhJxpEYVV0pvIn0rxK7bKCASibLh9hOfs37gHbMT0obAb5POaUAymOL6KglCE6QTrCKk
	tfyF+Wr0oSnqmZg+mpS2AggodPGBA/+0C840jYECNt7mF
X-Received: by 2002:a05:622a:4d8c:b0:50b:2876:586 with SMTP id d75a77b69052e-50d3bc2d982mr96081821cf.5.1775130329866;
        Thu, 02 Apr 2026 04:45:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8c:b0:50b:2876:586 with SMTP id d75a77b69052e-50d3bc2d982mr96081311cf.5.1775130329437;
        Thu, 02 Apr 2026 04:45:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:13 +0200
Subject: [PATCH 2/7] dt-bindings: display/msm: dp-controller: Allow DAI on
 SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-2-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Z2/9UqtEtBsglgzBaJ0JiBgZ+BcLHLqDj6g4rOOZYU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbNbiIvuacgY8VI0ynmZvX/Ny5JFSq4MJ8GE
 UDIavP3F9qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzQAKCRDBN2bmhouD
 13krD/9t1ubnPWoTx8xk5+UEzCbniAX8/xtY6USzQOeOjJCAv7cXl4ensPg4oZQTPD9nEyqC6iq
 LrOVmpaKQ/Pn+cllIiV7xCcyPMXRczXifWWx6+xe89sx4fofNLyILDFAa1p4L9xl/awOZc8gqFY
 5TopRqONu6z55yVHaoAlZyfolP1yqeRAj+7cOe6nllTU5DFfPNQtPe1kU9m4ZS+k3hdvK1iWCoB
 2YlGaVjp8miHCDfRh+O6Qy+Nw4yVHI+xMqkVzU5qOiPEjq2txcXdQ0YSdNUonDCzPW18lyCNlz/
 3NfxL8/ujfw7ZY5Z/hr6ceG8jlz4DpsLmNEvXvIrLwNYYN3ic0KYAebinvwSzku567pe/NLCjyo
 WP9ZwdTirPOg228kNJ3sea9cvQXhP1o/+dG562Y80C3RWHwF4DlfRaQ9wW8UEwvbG/zYjIiqp7T
 KH0zEQZ1FSCyM934R0eVRRMIQpJuNpgNXEGuCtEoBKhbuJXaLEIDj9L/gGZEQGwIwc/RGPohTuU
 qL3yRSeIhy9H2p3+xdZ6w4+Bcm4zgpely7abiMZa3RIMlgP/6MA8uyOU/WW0bb+phRBJe9chYAH
 jrNBqCtDqbrQvKmB0Q8nLLvQ63VkGD/1IyuHBxdb6Kt4O8Vz62Iet8RQVMJpbE9PJUDKzTW5chq
 KDOKGjkJQSccXgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: J9fkBhZgqk-lbKQ8wP7yIg3AOLdPsYse
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce56db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7SpLljjrIQYGA4yF3eAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: J9fkBhZgqk-lbKQ8wP7yIg3AOLdPsYse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfXyJAyYIqziBcN
 Q2V0yxal1EOKqAh7+ZTeeUWa7IJYx8/QSmTxXJigxOqBAQrYXJpkfnciAHINehJPIBVS5I3OH5n
 SnwjRdGLowvTkfPJOBxKPfco3V466JD2avLe5p1U9nm9wMy/9ijJHENIMsdl/Q6Mq8fHN8cbkyG
 zyAFT9Xp4lo4cciX/1W8NR6Ynq1Z+X/+2K4e+059OvtZaGdkMHqfp8A6Mj/PQWxOS63OSAtzwNd
 T870QZzbRCT5vMFOo6PpsRW2wfFzrCbPp9EMf494yFsQZ6ZpctvQnLoa9Fhsq7oTX7PjAMc8SrH
 Zp6597CkFwPT1TkOuZ8M2K6vbjXFCr4PGS4P5IEcaBpyJD6PwJjS1y8aMsEpzpT7O3LcyM78dpF
 vvregylEHSkOq8uyy94Icw3lJo4nUb2KqRGTulNqA5Q1SJBDlUclxSiE+EumotLXxgto2oWIUlq
 AldKzDXcDNbcjNq3/Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101538-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[af54000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 881BB388931
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DisplayPort on Qualcomm SM8650 (and compatible SM8750) supports audio
and there is DTS already having cells and sound-name-prefix.  Add SM8650
to the list of SoCs referencing the dai-common.yaml schema to solve
dtbs_check warnings like:

  sm8650-hdk-display-card-rear-camera-card.dtb:
    displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e4f17d29343b..f8daaee8d065 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -210,6 +210,7 @@ allOf:
               enum:
                 - qcom,glymur-dp
                 - qcom,sa8775p-dp
+                - qcom,sm8650-dp
                 - qcom,x1e80100-dp
       then:
         $ref: /schemas/sound/dai-common.yaml#

-- 
2.51.0


