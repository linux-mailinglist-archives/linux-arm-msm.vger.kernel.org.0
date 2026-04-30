Return-Path: <linux-arm-msm+bounces-105315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEm8B/Ym82mZxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:55:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D74A049E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AA70300B290
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6E33A8743;
	Thu, 30 Apr 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o27+erCA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqEFSrbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093763A7F79
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542321; cv=none; b=Qj9hyoy+xWGLWxNws+cKh9HlXbDa0BtQTZpfw0uq9Lj2r6bnzAl+u9jYAN+1GAoqNY9//ypsYlz9/5mGVUGbmL5/EYROttTEY21v7MWiOzZxrRy7Xm+yTYnHJpxeBnmvcHsnx/Gy8gq5tHYpqtCG2taZ1JMOvHcDS95HIXHrEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542321; c=relaxed/simple;
	bh=ugyiScs0hYFYLbedzg8P16mV+6LQJr8Rpje0ur3H0Ck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s16v/4J/+yy6VqXs5peUGim1K1dz8LCLasPyYpV0dKAOiS04otKCP5O/gVK51khL9+88T2Wl9Dt+hfsxjMZQJ6Ml/DQHF/6th8t6YvqLl5QFx5/lzR4fRpiImZtVnI4ty6bL0ZInYefcGgV3jLssRKNTgiv9cACthJVs4W+hqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o27+erCA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqEFSrbL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U44XOA2099527
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4TR2hgyAocOg4yzQctMkNu
	sg9NkxK78eVFH3lHgb/5w=; b=o27+erCAndnK2hEKBhLlyBKmatx0d96B24gbjY
	t4/cDO7tBJJ2zx1QbL4Bomv8TYrDeJAJBsIfWfBfubSxsQqasuEej0QQMTeTfIon
	4iyby+xzvMX029c7d9phVB2ZZi26Xbl0J49Ec0u7pt0NCtZmujP0SLAcKQEmdPA/
	TEKxF8GySeknQnzAwMzyDnE8HpyMae3JKLVfVOUKsPWg9od9ljg5xuIgmLrGP2hR
	UvqihgX7YURwicl3YDjrI6FuK4ed5U1rwLzPeV9mnyO69WdbhvA6qFWtv40SnQ0/
	/DESxDu/WojAY6o8WgxmkeTPoEhP2/Gf77ll18eXzkoz4JUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr415k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:45:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso927826a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777542318; x=1778147118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4TR2hgyAocOg4yzQctMkNusg9NkxK78eVFH3lHgb/5w=;
        b=SqEFSrbLuYgd4WoagpYGvU1BhxyxzQ46Tn0NcqFsqrmd2sweRBAeRggQ5sRIa1qcpK
         Zb+NCJ959dgkk2igZ6S21J/vxnykucesQNjaPCYdIpYMgzgsxEZQcZ3uDTgWuRG4w6M3
         pb+we836HEG0zUoh3VNTqgu/i+GHqs4OalCwzXhjXyEcGx0UN+YCgfrjvCmwQDG0zvIG
         EDzcHY2Bntaik9I7gfosHxNndQt3PDDxVL1ALdSh5YaXTGIQcATSVOoayrK2uTmukbcJ
         3+jjPwqUDmbW8jxSLnmZffnLLBktLs1z7hKDXSX/5aQttI5xCydaRZjDhQSOMMUYyvPH
         ABqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542318; x=1778147118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TR2hgyAocOg4yzQctMkNusg9NkxK78eVFH3lHgb/5w=;
        b=j7TC9gPSnz4UpWmdt/nSZrXueu2Q9531plbwWHpFTGqb7ZqZC2/jwQZSQH3vDkQ5Xu
         D37pcoCCjP+rJ2Gz4FT/aSjEgbsHmcXC1PTPzRJpCArMYQ/3swVaIkDphlxRrQmb0QlY
         tANPSqOak+DrDkIOYeiIDJaeja/BYsAmNaHvO1QeYCMJF20Ni2ZmS6rz04zwtS5ZSCil
         rwzKDYwZeTQN5sNtDWIlSyQhK+AaWIQO6FMRKj5o0sbWCYZGU7k+dNgNzGhcf0jPl4Mg
         KdOePIV67FSunc5V4gB30i/x056iGy8pqFkSmi4rhL4dCVep1EBy1skP3bJHsHyxOuuW
         yrVA==
X-Gm-Message-State: AOJu0Yz0L7HR0Q5jz7ZA5YyLda5suuncXOr49BIJC/KBCrVREZBzOJP1
	KFqc3tC/GSqDhsg592SaN8RE0dw84PkECOIjh2Ag7kjtBcGvo6EJJGWsXT5hCkViHbo7D9SAbnm
	6mB1sd4DiTMOJxK1791p3e5Ff0LtSbn5BD3P72SpXNI8WK7APA+fMsfR+ULpThIKxFdcp
X-Gm-Gg: AeBDiesYHNL7wpAFi86u7fDXzPWesRmt/BN4GfarAa3mRKOo5usmANGce5cguqWhUPI
	zmmsw1qEvnNU2If1uyw2tVlWJUSiV3aOUgyaXUZk8gbiYnJsKV4RmjOQTGogfFFe856gF+wvmgq
	LeSwFCLTToI62vypiBJUaTTaWPJXzauGBW18Xqfjq7Jvg7jWljLoeHlfPqWZh6bEDIH+9OHVA6z
	JGN6Wq6R63/FFYUQmmIE+E70iEzeJwmvr8+GWWMnutrSCX4ba/ctoFj3pMAcyJtu2CK6VKXzhp0
	MMOS/dO+xnLtMizJaC5JjbKIZR2mbKAYvp6v9JjsK9vaWHIekFKnFaMxKniR6Vj5ZjI3UZqXbF8
	8d5EiqmEIMQYZjq9wzRx2VglAntLb8IGRiJOYH1YiSyv19TDKsjGp3nQc8UD1+A==
X-Received: by 2002:a05:6a20:5493:b0:398:7c6b:8615 with SMTP id adf61e73a8af0-3a3cf57529amr2276410637.6.1777542317979;
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:5493:b0:398:7c6b:8615 with SMTP id adf61e73a8af0-3a3cf57529amr2276369637.6.1777542317503;
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4718937b3a.48.2026.04.30.02.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:45:17 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH 0/4] Add compatible strings for RPM and mailbox devices for
 Shikra
Date: Thu, 30 Apr 2026 15:14:55 +0530
Message-Id: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgk82kC/yWNQQqDMBAAvyJ7biBGidWvlBJSs9GlGmUXiiD5u
 6EeB4aZEwSZUGCoTmD8kdCWCtSPCsbZpwkVhcJgtLG6bbSSmb7s3epp+WyH8yk43ld3y6JMwC7
 iE3vbRiiRnTHS8R+83jlf4FhfEHAAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777542312; l=1064;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=ugyiScs0hYFYLbedzg8P16mV+6LQJr8Rpje0ur3H0Ck=;
 b=bXmnJ9DHIsHnIm26jNvNfk9q947qAJ1hmfMnNurpjTGwu7H0uRkVYrrDJD/2L0pPmUU2bx9W5
 buPJQxyUeGGC12+He8bZLBKSjZomkXxnQThOZAyV3O6kqXD/8SO46yt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f324ae cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MCz6-0gsceDSkw-wabkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5NSBTYWx0ZWRfX0SKPSUZxzBVe
 LFEMNSnIpyX5ykx3euLRaNzl/alLWupQ30SnY8W01dg7bN5uhe+sriIpSRIBCKobttB/VPnBfCd
 wtRW+CQoa52plpBmfAxbSEWh487/GnYKrMPvt580HYqonkQbYPMOu1wUPxKRv/QTaqz2VrxVJrq
 PuH8CNO9WZJuWTO+zFldMH05MWqm//hJq05fzo0gspB0tUchaPHMeS7+dwRi7tCHcJn/RWjrjGM
 7x62JZRPUs0lLxQFqBbPvMuhnX4zu7RL6AaarcFxJBVfQPE/7xCUuJLCWHc15w9JLsgy7YgK/Dx
 MH3VZO34BjmHt1RCb8m8A7I67W08hmNmyZipsRqSNomzTWgGD+yDK6SU3lE0gQbZ9B5NDsYfkey
 Vo3Wb0sXDuPPPe6oMvaMe3ci0PWMTTEeZ7kb6/AvvOXHzY38QjTMAfaen0KSgveh1WRFNYoOLmv
 j1dWFC5TvF0HvQsypsw==
X-Proofpoint-GUID: R1t_IctE9KkAADvQUydcfDpT_onn_zmr
X-Proofpoint-ORIG-GUID: R1t_IctE9KkAADvQUydcfDpT_onn_zmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300095
X-Rspamd-Queue-Id: 3E9D74A049E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105315-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.
Also add APCS IPC driver support for Shikra.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

Vishnu Santhosh (1):
      mailbox: qcom-apcs-ipc: Add Shikra APCS IPC support

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 2 ++
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                              | 1 +
 4 files changed, 5 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


