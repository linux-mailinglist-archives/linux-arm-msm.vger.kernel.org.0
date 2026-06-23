Return-Path: <linux-arm-msm+bounces-114144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HcbMLcVaOmqV6wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:07:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B966B612D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:07:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OeXA0PIr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=baA7J8me;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114144-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114144-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 827F8305B97D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF7236E488;
	Tue, 23 Jun 2026 10:05:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF136A36A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209140; cv=none; b=AqMdGhYfWdBoEjj4k7O81tPPa033fHCfzMnKWydUXL8VwXUepL/u/NyaIemC/pStvo6UTwA/eEJ7Oh40DQUGYtd11iwxZJBVHXxxrt81oy2vAGt3V4IDgYWQX5EYGSAkK6BljjTJAJZ4S/HtNX4teUZkY9438K2L6Jr18OXa7Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209140; c=relaxed/simple;
	bh=Pv0tbeX+TyIfLQovm/ciZVjweVaoKtdkg6d7bQLC8cE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sr2kcB0jgTPGBKr0zaECUC1seXN9egIaqOcm9Qsg0Jtd8AuhbCAbCzJ01JfOU1BxZSiwkYXSEcuY5ZNJ8KYX5cX2Oswj4aVbdfBjbCDKdoRS6D0sfY1Ev/Wexku4eEoJuOJjrkx92OMFkCaQFGDybkfkfVo+Wn+NbJZhmF18vug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OeXA0PIr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baA7J8me; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8UtNV3243184
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oqS7gcc+7CisJCCUuyfIrz
	xMclU2XzUbuPFvuo6CJlg=; b=OeXA0PIrBGGFyJz45M1c+mBcZUijhLzOlbJmua
	FVQvi9UyZPxEjYaGQZJ4VsBaYKYA6rpIF8f48WgksbnCD94Mlwmxk/SosTUVRgTB
	ir0ijocRaTtT3gREmjZtGmRbA1EQNDfwtP03ONCDkUM2ZE3LAVvz5K1tlimPkBI6
	2pZHEkIwShRpA2yA+DR+yxnJVNDZ3XtEByCbDNR+ZsmjJGu+Lf38K2B/CDF3Wi5g
	n8sB3KF9oFo+rAv8+ep3q/rMCwufhYzm6GwFXvCW29eP96+dgMQjzfhVWH94mYzn
	YXHn1+7EEqE6SEo4amPVS2mJNC15ISRRkOp+XmJsfcL/BcYg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppyge5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139c98d7bf4so145179c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209137; x=1782813937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqS7gcc+7CisJCCUuyfIrzxMclU2XzUbuPFvuo6CJlg=;
        b=baA7J8mezPOSLWT5QGU508Pqo3ibNBigKT7Rx6MjTLQBB1B7BZakB4ndYx8n7f1ahm
         ipte35TXiKmmou6BZ4BmEKYOoNucrXCq1jB+q0UGyOgaMnfjmD7arrmFCKRf1na9XJFx
         iFRzQkHtZgWy5wRqLqotM5j2+hNrM3rjT2KA6iyP31U6LMLPtTF2rfVtdQ+Qwi/iZDM2
         FKirtwPdsui4oC+d1F8r2nmz6sc6rQCve3cIczjdPjezB5i3TW7yONz7xDdX2jqddlg1
         HSkwami3aOZ2SaRkLYdK75LtPKYX/woDKupV94gVa0Eq08Wgu9Y2wXJ+hEK2sDFK9q7t
         tClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209137; x=1782813937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqS7gcc+7CisJCCUuyfIrzxMclU2XzUbuPFvuo6CJlg=;
        b=Pq2/nptLDsQ2SIxQPbWLE1a1f9F5Pe89wGsJ50MXDDnUo8TGJQyST2LHFbIEtF8ivi
         y39fRWdC/0v2ztzjrvApsGWBWiwG8wXQbXlLqxvq5Su5FN00vbRfVHWBt3CTTGTBRdQh
         3zELFBVWwZMfrPj9LUwNBFgaPat7wDkuE0ncOtYTCxNjwTegfYrYHe6Wm9nTF72sONA6
         GItO82MB2P0IX8G5zRPzJfTNVIoIpsw8RVUGzmEMwZhfbFkE2Oj1Qzxzqfh2TjLu4iMS
         Ti/lzwednYULm3rsNH0nzdUHz/7nXU9z7krUAEVGTBSOqcfTox7FWbALaRqX8B1fwBMx
         uNUg==
X-Forwarded-Encrypted: i=1; AFNElJ9iuYZ76GTe9uznnL89InmAOkMG0cqr8ypKJsPZm+y8zx0M0XwQCa758zawPNMx8yEqXopD1TZhdBQxySby@vger.kernel.org
X-Gm-Message-State: AOJu0YyvLtKoY6zhHPFdCBcRTFkbviz7hu5DC2JcaQZckBY7xNiVBw8r
	1ihQKxg3gh4sN0nGH5s9lpdHjYBLgaShCC9i58NZ3fdnhkfAM4NaE5bquk0BX0dSHbdcY/VzG/l
	09Xt3wTPCTTVgidC7h82WcYsYnOdaN6N/gwxruwYIB63V8xa/dwU/CgD5ti0vTouieP3A
X-Gm-Gg: AfdE7cmSf2nfR6/DfvmHtuoj/f2m3YhLB09I9G34M5oy+jnRLhiPP5eHmapHhIkRLAk
	MY/cfLBNQcea8PKpkBjcHWWSaep9wciQ9s+/qIuutkMXK6LIHUP6xX2Or9kp+W5M8l8GOi0EyTw
	ngTsAwO+a+rRjF13Y7AXfTMv7Wg9Urg4xxT6LSZuwOnNdgCF+zh5IDJvEFOOGx2UMUti0ewbjwJ
	z6LTCuj5jNMj7P+CI02QqulzqZXR31gtNY8UbOy/1YlC09iAUqa1EP1bbhjXptKdUtEZOJP0GwV
	ebD4xtRV7pGvYN2eILzvPjeKa89K65MrvwDwV0x8wKnMW3Hagq34dmespBpZSiw8rr3baSqv3FH
	PsUYhs9UNAWQBpooIx0VSH7NNPjtN6Tx0GiMjiMard5HwUWbCmfQOyRRPkBXasA==
X-Received: by 2002:a05:7022:6612:b0:123:3c24:b15 with SMTP id a92af1059eb24-139c3cdd5femr1761236c88.19.1782209136848;
        Tue, 23 Jun 2026 03:05:36 -0700 (PDT)
X-Received: by 2002:a05:7022:6612:b0:123:3c24:b15 with SMTP id a92af1059eb24-139c3cdd5femr1761189c88.19.1782209136273;
        Tue, 23 Jun 2026 03:05:36 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v7 0/6] Add binding and driver for Kaanapali SoCCP
Date: Tue, 23 Jun 2026 03:05:16 -0700
Message-Id: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFxaOmoC/02NQQ6CMBBFr0JmbUkLUoIr72FYlGEqjdJiR4mGc
 HcLbtz85CUv7y/AFB0xnLIFIs2OXfAJ6kMGOBh/JeH6xFDIQktdlOLmJ8EBcRJ9jaWtG2klKkj
 +FMm69966tIk7wyS6aDwOW0FqpTdtcPwM8bM/zmqTf/FKNX/xWQsp0Fa9JNUcu8qeA3P+eJk7h
 nHM00C7rusXtku/68AAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=5634;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Pv0tbeX+TyIfLQovm/ciZVjweVaoKtdkg6d7bQLC8cE=;
 b=YQHwEXw9RUamlnh5MA6jW2tMGusMcDiYkJ2avwcDrvHKRilY1ifVbQ3V8y2xV4DuFWqe4dTYd
 8YipdeTQPZQCnoMU8WNBtQBfWKvhUiEKvQahOX7MpUTwIioW2b6rgDV
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX8GVqm5jXQFJH
 5U2XtAUwW+NbVioZhbnwVKTZLPYc8cSOduqvfoo/I0XMNhkvgcDgS87T/nfBcx6oUkoKhbMdYbY
 wwBG8Th1K82UWFL+/QW+AXJxXCuHAPF6ieP2rDTFaTWbLmA6n+jKNT1pk+1L4VkryUUGAUosIGy
 YYHbK4IgL7ic/dEjo8eSCnEXuhhQJCRSqeStHMB445UqA6/x0bQBoQOh2q3+H9IdVN/C0R/H6cw
 Ifnm9S2LcgzR/nuqmxnWBuq/XMQ24zjIFzx5/tFwlnhU4pu37RB6NYuwnso/ZxlezfBalwq9E4t
 tiory6IEXiJAWSx0eeuYpWSh39zzIOoBXJSDt54YAlhpS1NHbuUx22oKlU+69DLtHcUtOKWkqE4
 kJXxJxh2bqbEaw4xpyiqHYb1Z+TVkaHLoPsQgN+KNgmZNpELAVFb3ivPc5D1jfrk/lu9ONS5Vb4
 LN5GpSF08wnh4CZEGsg==
X-Proofpoint-GUID: OciFcqDa1dr0OLBEHe-Lib5t-J_jzPX9
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a5a71 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MYv4Gc5Rv-h9wPO-xRgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXwe/tpnon0Aqf
 oL9YU0y/Zx3b4RV4vLhS2pzfW3DkwCTlBU+T4sLIMllq/Xh258THB5159QAqCcIAYPl5aCRoAAL
 58FxQ22MsTvmN9EByrBo4TTp/LhTYUU=
X-Proofpoint-ORIG-GUID: OciFcqDa1dr0OLBEHe-Lib5t-J_jzPX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114144-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:gokul.krishnakumar@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54B966B612D

Add initial support for SoCCP on Qualcomm Kaanapali platform. SoC Control
Processor (SoCCP) is loaded by bootloader on Kaanapali. PAS loader will
check the state of the subsystem, and set the status "attached". As the
interrupts are redefined differently for Kaanapali SoCCP, list for the
interrupt properties are moved out of pas-common.

When we return fail in the rproc attach op, current remoteproc core cannot
handle it correctly for further recovery/firmware loading, which should be
generic problem shared across all remoteproc drivers that do attach and
not mandatory for normal bring up, a separate series is used for resolving
this:
https://lore.kernel.org/all/20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v7:
- minor coding style fix - Shawn
- check stop-ack and shutdown-ack when doing attach - Stephan
- update "qcom,smem-states" to fix phandle-array check fail - Rob
- Add interrupt list to qcom,shikra-pas.yaml
- pick binding for Maili SoCCP
- Link to v1: https://lore.kernel.org/r/20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com

Changes in v6:
- remove ping-pong in the attach workflow - Bjorn
- fix handover_irq imbalance - Stephan
- add attaach callback to minidump ops table - Jie
- pick binding for Hawi SoCCP
- Link to v5: https://lore.kernel.org/r/20260409-knp-soccp-v5-0-805a492124da@oss.qualcomm.com

Changes in v5:
- squash "qcom,smem-states" patch with the change changing pas-common
- drop the patch that set recovery_disabled
- remove the 5 seconds timeout in qcom_pas_attach and related logic
- patch rebase and add reviewed-by tag
- Link to v4: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/

Changes in v4:
- drop adsp/cdsp binding that have been applied
- move interrupt list out of pas-common yaml
- add constraint for smem-states in each file
- "wake-ack" interrupt and "wakeup"/"sleep" smem state have been deprecated in design, drop these
- coding style fixup
- add a patch to disable recovery during rproc_add to make sure rproc_report_crash can be called correctly during qcom_pas_attach
- update the handling for irq_get_irqchip_state -ENODEV in attach path
- skip qcom_q6v5_unprepare if the state is RPROC_ATTACHED
- Link to v3: https://lore.kernel.org/all/20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com

Changes in v3:
- Drop Glymur ADSP/CDSP binding 
- Extend the "interrupts" and "interrupt-names" properties in the pas-common
- add missing IPCC_MPROC_SOCCP definition
- fix complie err caused by qcom_q6v5_wcss.c
- code clean up for late attach feature
- call rproc_report_crash() instead of set RPROC_CRASHED state
- fix q6v5.running and q6v5.handover_issued state handling
- if wait_for_completion_timeout return 0, set RPROC_OFFLINE for PAS loader
- Only ping the subsystem if ready_state is set
- Link to v2: https://lore.kernel.org/r/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com

Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Jingyi Wang (5):
      dt-bindings: remoteproc: qcom: cleanup qcom,adsp.yaml
      dt-bindings: remoteproc: qcom: move interrupts and interrupt-names list out of pas-common
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom: pas: Add late attach support for subsystems
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

Mukesh Ojha (1):
      dt-bindings: remoteproc: qcom: Document pas for SoCCP on Hawi and Maili SoC

 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  |  82 +++++------
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 156 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,milos-pas.yaml        |  26 +++-
 .../bindings/remoteproc/qcom,pas-common.yaml       |  28 ++--
 .../bindings/remoteproc/qcom,qcs404-pas.yaml       |  22 ++-
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml      |  22 ++-
 .../bindings/remoteproc/qcom,sc7180-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sc8280xp-pas.yaml     |  28 ++++
 .../bindings/remoteproc/qcom,sdx55-pas.yaml        |  24 +++-
 .../bindings/remoteproc/qcom,shikra-pas.yaml       |  20 +++
 .../bindings/remoteproc/qcom,sm6115-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8350-pas.yaml       |  28 ++++
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  28 ++++
 drivers/remoteproc/qcom_common.h                   |   6 +
 drivers/remoteproc/qcom_q6v5.c                     |   3 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  86 ++++++++++++
 drivers/remoteproc/qcom_sysmon.c                   |  19 +++
 20 files changed, 642 insertions(+), 76 deletions(-)
---
base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
change-id: 20260623-knp-soccp-d7c3f790f0c1

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


