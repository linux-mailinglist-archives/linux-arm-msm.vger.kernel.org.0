Return-Path: <linux-arm-msm+bounces-96967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFErL0JjsWnQugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5B263BE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCD73300461D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67FC357739;
	Wed, 11 Mar 2026 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLFnQhC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+1B79Bg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964BA2836BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232957; cv=none; b=GCi10hAiskVvzdYQLmENCC3vp+DWdbRv/81RIi++jMQ/SVePH2/ssZo+Ha34zAaB7NZ4XFQF/HoF7nfD2QCnX3eAdFkALI2pVHaAbnBbqLX/SgwAd9q+IQiQnOvrbCbX9aJ8pM+qxrMAxka9F2CrxJ9g+S85zxexwB65jzHR/G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232957; c=relaxed/simple;
	bh=L9LmYv8a4KqOYPTP8d8MMLXR8hSAntUDeFVnT+a+4W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dm7iXR/UWe3JiZiFUKybUHqrsQvKkRd+EK17q3aoqQhq6cB/sPKWVdqv0S0JE0MhYY4Xx+uRS+HvKnZ11nMO3s0dkPDJMJxvliJXXi4pneRMBaz4e0T3CP+moKMo1bC19Luo+tJ8cwf98dUVY5KndovyLQPk0QB4uhCqX1zpkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLFnQhC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+1B79Bg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvHmM2622287
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7zq6aMQv4ht5OAgkaxoMXFfhgHLYK4u99dx
	3juwPAiI=; b=ZLFnQhC1vw6usoyHbaQ9La7BX1TZW2nugk4l5AZsEKvnM+bGMX3
	q0QauuY5n3olqcg9NKxL8fDK6E34fPLt1dpGB+RYLZtp+ISvKc7hg6S2KGB2LeSo
	k4jnSFUGScjaNp1srN0wFdkNMpQTQlO0xEMbWeZgFQkxO5ErYIrGgPDTPqnLAwun
	/SRapH7cryM2YdGLl20w034FjDbws89SoLVONnz/JPKPoL81Q1uK6/ugWiaMFqef
	Ota3U3YxpGeHIfBWkFYsSeWWfr+IjI3v3DmASbcamviR7q+zszS7j3pFBMq54xq/
	kFCMrcpxtrepfoLeaVE0kHwaMaoXAorZwHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h0amr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899edf01747so775940946d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232955; x=1773837755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zq6aMQv4ht5OAgkaxoMXFfhgHLYK4u99dx3juwPAiI=;
        b=B+1B79BgSXs9CsXhJLdsKdhbTb3qfRfVIJDRX00vOQygMKIHrEMZgAhi7xCrDaIpXR
         /FXWgthaq9nFwYueM4qRQGsdqhKRNe5SM5dCN8lg3vSE0wluUpwVGvPY49FSitUpUELm
         0qh7kkWLNr66qnR4iokrpD9EvDfaOsNQqUr1E7X8lR8lLI0kGlCRUwN/vEZJ/qQT4eK6
         jQk69bkrJgs1p3zCijvfyeGF+sVeytpLFShrSHMjO9JHYtuOXxz2kqH93eXEWpzHjUCn
         20Yd1E1JfGsVat7oNptXMUWcPeOFxxRvdOSgp73JhbObHpWFbEUve4EvQRhCfpo0easZ
         paAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232955; x=1773837755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zq6aMQv4ht5OAgkaxoMXFfhgHLYK4u99dx3juwPAiI=;
        b=ZNBKyl0/BxkdYu+WsQrDgx/FzZJSPjjuEZcTHL3oheYBjhLWEkAS+bcEuAXvM97XFm
         gLjeSn1l0pT1FY3s6TKf91xYoa0EgicK2ovSuOw5qj3ieQR0FR8Ativjz0KATmUlr8of
         +DKABFahz1gLiiTKifd8LkiWx+JnBy7Rkew48D/8XoOXbdq2Lqx1U2aQi94XtBlft0xG
         HRisZfkrWFRhH+rNRqdbllfqbx288lWof7umLhNrtVTj/qgh95MlnE99TYK9AIp3st5o
         i44yt2gZQQ/8bZifUuJ749TLro/YuAs1vksE2d2huaM0Dv99YcGmGm7Ve1cYnQ1T3GyL
         ee4w==
X-Forwarded-Encrypted: i=1; AJvYcCWEWafvjD5LwfUwUgeZpHXkKhR3D8ZuF/vo+xkUyXOotRq1behNKwH02ElsjLmlJlaD2vgk5HD1yJAOSUSl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SSNlSx0GRkeCv8J2h9DIVDqO26twc1FhufcMj0cO/QLFzPvv
	RSdNx0wJvkOtcB6hjlPled+VQ4ORfV/VvdKJjMmaXv3/xi3EQbiKDReCVuw5zceLKGlGUrXG3vO
	eTLiau3gLHfWXPUQZemckQQtGmNt7Vnn6hvBN4pNwv3ia1SPmgc31FL9MhafI9YvlNq06
X-Gm-Gg: ATEYQzw0wwZeD8R899stdjwCS59O+0R+8en0AIhvzMS96wS2rc1HgNxjB01X8VEShuq
	8KtQgxVlIP7IfemNsGeFNOz1Dd1cuJs472OTgekkORi2aHIoT5VeZ7grAzUr6I6Vg/Y5IQkjCVu
	oj2q76L3Jk2Hkw1k1jQEXEKJ8rR/fcoeztVDwLUJWuzdA27DiT2yItBaDLg6V4aFUxJqvYlHwyo
	/fO3XZs5PSJKBsgxLWMa7HigwgiBOCKKnJ49hxA+/MK9i5H7UNOjmS/0tx29G2AtYW2us4yYaz6
	82PzsQzpkg4591caILZ/QiIF9DorbQ/DUNWvCi+knF3g5GNjxorwquI/QAjcfuurcxJVCLK55cN
	LXAG/Nw/iD0cbf4xIDh7Fhesr6pvR7aygWav1oaUkCHYgaXEJUpA6j9Y=
X-Received: by 2002:a05:620a:4083:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8cda1a19697mr275598985a.39.1773232954853;
        Wed, 11 Mar 2026 05:42:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4083:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8cda1a19697mr275596085a.39.1773232954429;
        Wed, 11 Mar 2026 05:42:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm39011365e9.6.2026.03.11.05.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:42:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: add glymur crd audio support
Date: Wed, 11 Mar 2026 12:42:27 +0000
Message-ID: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Y9PGL3bjUDCMOP3WTP0Jiqy-riaIEc11
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b1633b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=D19gQVrFAAAA:8
 a=NEAV23lmAAAA:8 a=6BfG5fDPucmGwNyM8DYA:9 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-GUID: Y9PGL3bjUDCMOP3WTP0Jiqy-riaIEc11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX++E/bKDx4eFw
 P46H+92+8vN8s+4y+581R1Sh6JBGqe7Tu69CF1PfSNxGAE09y0xJQ5aF8zS3ag5kBq5BJfRv48Z
 nZB/yWeTIMGkJiJP5XLK+4edsP9JLRhX03WuAembnay0w+o7UkkMUDqcVKbFAvLipN9GSNjyowL
 ryj0H1wZW9BzCXnCd6tSiaB3/vHjOu45l8n7uDM7jTSz3mMfvTm48TYJcwl3LW1+MiDRT9RcIBp
 c+pp+vC1Qb3HRBaHLxvG5NGbeLWlPsA/cpDVE0q+nq6PRHDN5JtiAXrhFXFQqr/2507RZimDSpM
 WluQGLCOMxYc/F2/SROlYBAbe6nk8f1dTkFoaTBOECG/a/eaYy8xsGotXVbqZc2Wr76oEzzp3Og
 BpFvYMlAKuXf0MDGuWNxT20c6riTdXmCVaHEVGh/iXBi5xxi5TI7rnCHkD4nH7nC9Ee5KbdmRhA
 G2y7jW33vj4tu5ajZyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110107
X-Rspamd-Queue-Id: C0F5B263BE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96967-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lkml.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This patchset adds support for speakers and dmic for glymur CRD device.
Along with the dts changes, a binding patch for lpass-lpi-pinctrl is
added in this series as DTB_CHECK will fail

Also this patchset depends on ADSP nodes patch series
 "PATCH V4 0/5] Enable ADSP and CDSP for Glymur SoC"
https://lkml.org/lkml/2026/3/10/271

Corresponding 
tplg file https://github.com/linux-msm/audioreach-topology/pull/53
ucm: https://github.com/alsa-project/alsa-ucm-conf/pull/713

Srinivas Kandagatla (3):
  dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add Glymur
    pinctrl
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../qcom,sm8650-lpass-lpi-pinctrl.yaml        |   4 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 110 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 263 ++++++++++++++++++
 3 files changed, 376 insertions(+), 1 deletion(-)

-- 
2.47.3


