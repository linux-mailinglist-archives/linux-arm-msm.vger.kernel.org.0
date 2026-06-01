Return-Path: <linux-arm-msm+bounces-110549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGA3FplXHWpLZQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:57:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1BF61CEC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 11:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24D37304D44D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 09:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DF63988E4;
	Mon,  1 Jun 2026 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw1ENjO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cz5syKpG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD73396D0A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 09:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307222; cv=none; b=rJE8KAfOInt4SVcOehRAAWuYC8szc03r5dpz4QERHWmdkkjjA4pzRcVlNwAwqpOi7z2YV6OSKtSuE7DQORT7km8zGYLlvr6ZJcz+GVZavUy9ZDLxX0vObfC6Wc8qS0j9jaCIWCEQQNTQ0CMXtREB/EHCfqPyCsdtm/14dGY84bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307222; c=relaxed/simple;
	bh=7IQl5gBCstIzsB25wxagTUyFt2zOmpRhZY2BOPvDRsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lLHElJZajAGbUAaNa9Cu1O1jqTKLbYjgEk8VITNoBbTPHARCKlgIWx4NfB6EpN53obn6yTU4o02/05OuPvZhmxnW8NQLl9D1DNShq6ri7MExrwHbsiAK2GHf0acZj1WolHeqnjeDEDuV4uRkXvDHB1zNN1GZTba913am9Y46mFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fw1ENjO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cz5syKpG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518xKMj1012189
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 09:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bQKthfhJHJ/OKF7Yf2J7ev
	+iNLRDR1B1zOFtNrqX460=; b=fw1ENjO5pfCylBBNsHQKFNcEffxXp7oHYd4ydD
	J23U7GKbOFGjNNzHFJIG2ZN1mMWAmFxo6Jk0Cy8pZ1IRLRBiiQTZCEKvs0WV7WJB
	NWZW4Sso0dfkrYFXu/WrhEnawt3xv0EJnubx2hIcNz+pOIVAinGRLyuwIdyOINnO
	klaIG6H9xMJI34y1kAkAlub1d2EZXaIPIi3lKvKpX4shkvnOz/5iyruFYCUESust
	M/aVEqKNej/338Os9eCUBGYtPKzGzy+rE1mkJR8mPL4YhV7MM+I4nhvg0CpMjEnJ
	H18LM+R2dvONtm3TJ5wW03fDye5Upe8B41DzxOT/k7nMQLMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98esyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 09:46:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d13328dcso200664081cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 02:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307213; x=1780912013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQKthfhJHJ/OKF7Yf2J7ev+iNLRDR1B1zOFtNrqX460=;
        b=cz5syKpGNFSctP1iiLUGH9YG/N2Lp03pnCqa4o2ZDPssmgBN6XxA62gLLPNquOfzrL
         taHNvCatkIpgV0lSzF9Py0vUlOjwvTy59WjTzFDFmf1Q8CmpixcdXbsbbKzoN96y3p9u
         H036c3d1TEVmcbYvLQLJZu77npCvopCBjQ1vN8tA0ouLmPuVnZg8YLFPtfEHZ7NuZPOQ
         1eAiYXWgGFWzguFxbiGz7ecrnnCxEHUd1QMCx5nX8+QpQvTQ7J6gG5snqL7R+BlBAWxH
         Duqra/ZLzCLjCIlDPno6fuSVkXNRDQivtsw72TjQyGJBfrDhyJ4IqJpieLYNzZDFoGu6
         fLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307213; x=1780912013;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQKthfhJHJ/OKF7Yf2J7ev+iNLRDR1B1zOFtNrqX460=;
        b=lH+sHWSpag8vKXoVpd6gZd29S+El2aP7wyCY09KyRj3JY7wHt2XXe8NndEo740BqUp
         JC7x/ZI6ADkRpaWtJC9nybCQlf+EOouNkYXAVVkHlCRLAGORdoxHFQeyaE5L5GcmQZFS
         cyeIN+gse6xldDaS/9ve3dNFGlYiXOpuHdqPqsz5ieB+fWG9/KlfjnJ5pLGz+ZucT2Lx
         sjVD5jGLHB8BkfQeHrH9dikQpOkQQ+DsyO7fQMmEKtzYw98JFjJXRqYNTZh+NHuG8Ww9
         /tF9AeM+SUOLBAons4YAtG5ChfmdHb6TL9potRvUGUnNtowHLFkAYTfW591iZUzlu96k
         JqZw==
X-Gm-Message-State: AOJu0Yy8rZPMIJJuwHOM1Vq+DiYcpfwNX+KePCAJrqa+gJBplt0M1trg
	2YLeUYCVGmguLkdBdSTfLvHe+OtPkVaS0bgAqdUsK+2RO/PwhR3WTluudBw+Cirka5gEdEASS+f
	WL4WhzzGy3il9UPQRgtKOYvnc7T6LJuNOtCL6DkJ3N537xUQIlyHoHo05z9z2cI4hMBfH
X-Gm-Gg: Acq92OF05k7Hkw9lwiDD3v9HP1hFRkC23fdXslFR0SMAovLwyeasI4xJBmoQnJehbhj
	gLEziviJ2a+/RT6Vo4L+FxkwlZwVZUCeNyHVLrV7YMtSrETL7LP2lssMl4hkfCJm+csO5oA/ULV
	QQb5DIFkC9JsXckPlmK7KgeiLYwmWRy1Pa2J4js07UgMO6FryAgK++YNq1WIuGfrFWgGWv6y8px
	90VPpebyNQP9LAEkktrkNPYuHZcUUuq/93x1MXSyIG5GhDf446vYEV51KEP8PlNWdbBmmtFqOAY
	7RItO09dkYnYkmyO43/Ngp8jSmJaX7cCB9UVf2Kr2YCy/GA1+HFeO87DaduqAqm2bYf9rzr0rIp
	H0TM7eufU08cukx6yo0Rm3SFLjZR3VjTDsYX84v+TOUBYUVVDvES22Ahp/adGKr4JX3LFXLhewp
	SCFeUeaB1pFXUA7hcbuWhdgGUYLlZqiBXuSFS6KPXVv1kC3A==
X-Received: by 2002:a05:622a:4e98:b0:517:5aa6:acf3 with SMTP id d75a77b69052e-5175aa6ada3mr18890101cf.12.1780307213409;
        Mon, 01 Jun 2026 02:46:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4e98:b0:517:5aa6:acf3 with SMTP id d75a77b69052e-5175aa6ada3mr18889581cf.12.1780307212935;
        Mon, 01 Jun 2026 02:46:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:46:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: enable WiFi/BT on SM8350 HDK
Date: Mon, 01 Jun 2026 12:46:48 +0300
Message-Id: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhVHWoC/yXMyw5AMBBA0V+RWWvSair4FbHQGozEIx2vRPy7Y
 nkW917A6AkZiugCjzsxzVOAiiNwfT11KKgJhkQmqTRaCR4zbaQ4qCWhrUxNbp3KdA2hWDy2dH6
 3svrNmx3Qre8C7vsBHvXkXG8AAAA=
X-Change-ID: 20260531-sm8350-wifi-3b0659bc183a
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7IQl5gBCstIzsB25wxagTUyFt2zOmpRhZY2BOPvDRsk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ZsKFf5IqHd3afcHFRblpsxG6r91a8WNJjg1xtg1Xc+8
 1202rVORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEwkqo79f1StnvUu9p28ewx0
 pvAtL5unt3uFx92tDfXqV08E93y4Z7/C4NvbTW/iki7VzG5L5CtpkxT5qr1onur9l+U5Sco9UXo
 x3ZOSOf91FtWxHAv/LbeO15PxtOKqxmTTVdu4GBhd9wSGb1yyPTvHLkqAZ9OJK/t89T89XCkQL6
 Yi3T/pW/xv6QKug53v2vIZzjPmBPX9tt3Rt5/r8Y9/nm5vdNOTeXyNVv6RuPRejudV5e8Hn+3ky
 73z1D7k8H3a9erdMtcbzXYvWVxTT2+Q9VJkXyac1NGc+zpO3adZLdXYNV8nVezQ+tkbW1c6zvC7
 xPU87lhbqGdI/EweF+0DgqwcKgm784Su2k41OLnhmy4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d550e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6KS0kTMdj-vf8_meW0gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Vt_lg2l1gm3ymU1DP_djkYA4vMnUYYqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX5dyAmSJKeXFw
 Kqny3XZjYF/15cFng78LdBMUS7Uq+Svkv6wevMJqKus9vrI5jrHknPKjTQRukh7Mz95exV5munp
 XnvcCbxhC9Nd9X8Clf0tBrKwmGSPVHVo8Mk6zflsPb1DeXdfXvleylbG/ae4ieDy2fmJzBiMg8D
 vimO0qSM4JQJinOgk2L6BGD/RKmdtD6L8u6O/SQvnPXpcst0aQeXTWLywtXp1q6u7kZCQJv8vy2
 WpO2B/89yAVmzNYQ3BLoenAuIyFEv3QR7YZq8Kr6G81lQsZeOK8aEup+G9pNCxjCUML8d4MmXit
 A7O6oGnQaICoKkd2d1p89Pz4Mn8na/TxYbfIIgDjVDt0CXINVZsewqCgRZCr2JX4nh1Mg7N0YQT
 seJWspxJBOJfHRRq2yZK+a1VzVbpbZKa5OZF040ewT5YFuiuDpZrYq1QBGDV9IMnOnD3ZzFRcvY
 Ku5hXZwdYVNTGRCQ4gA==
X-Proofpoint-ORIG-GUID: Vt_lg2l1gm3ymU1DP_djkYA4vMnUYYqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110549-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD1BF61CEC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SM8350 HDK has an onboard WCN6851 WiFi/BT chip, which for a long
time was not supported. Bring up different pieces required to enable
this SoC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      PCI: qcom: fix parsing of PERST# in the legacy case
      wifi: ath11k: enable support for WCN6851
      regulator: dt-bindings: qcom,qca6390-pmu: document WCN6851
      dt-bindings: bluetooth: qcom,wcn6855-bt: document WCN6851
      arm64: dts: qcom: sm8350: expand UART18 to 4 pins config
      arm64: dts: qcom: sm8350: modernize PCIe entries
      arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip

 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |   8 +-
 .../bindings/regulator/qcom,qca6390-pmu.yaml       |   4 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 142 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  14 +-
 drivers/net/wireless/ath/ath11k/core.c             |  92 +++++++++++++
 drivers/net/wireless/ath/ath11k/core.h             |   1 +
 drivers/net/wireless/ath/ath11k/mhi.c              |   1 +
 drivers/net/wireless/ath/ath11k/pci.c              |   9 ++
 drivers/net/wireless/ath/ath11k/pcic.c             |  11 ++
 drivers/pci/controller/dwc/pcie-qcom.c             |  25 ++--
 10 files changed, 275 insertions(+), 32 deletions(-)
---
base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
change-id: 20260531-sm8350-wifi-3b0659bc183a

Best regards,
--  
With best wishes
Dmitry


