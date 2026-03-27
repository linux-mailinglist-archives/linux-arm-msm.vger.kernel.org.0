Return-Path: <linux-arm-msm+bounces-100288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDKmCmt1xmlFKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:17:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 951BF344161
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32FC23081B1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2D23947BB;
	Fri, 27 Mar 2026 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1/nQgS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzYzSov1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8E0392836
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613636; cv=none; b=sz/AoF5kcO7x9ruZy+HAu1lhAK5ZWF1ShPgbpu/wlwC28aP89tjN7aKQd8kA3QFo2VnPnU4Y+onUrP31PAYyIIt4Fgf2vRUclxD2fXEe/MXox6xiHAo5M6/8+UkgJpjEIpIyEC7Ow3E+RzTn5RrYRbW7GD7u+AEvtPOubPUFc4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613636; c=relaxed/simple;
	bh=CpiJi1wFsZbfzyH+f0CtUiZ1fQugjFswPbwL9ZRyT5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j+g5WYq2GzNCQsAx3KtGhurNe4g2mG18+8Df5gCNWLh1kbBogyY0IguKG5WthfaBM/CodO8wj1eQE3nCpUjRVC/KTfbUVm3SM+/kC05QlmwOXSM2QGzxoYgmZBzssvtQAd4erc2ZUUzsxavlwqIuokPJtPE4t3SJD91USaRaMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1/nQgS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzYzSov1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vnii3715854
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Kbnk1Dbp628OwAbcO4W3dN
	KPCATjO4PL3FJbktC7gOk=; b=I1/nQgS1fvGRIsowpfPHQcMaUVCmK5ljlvlrhw
	JyGw82eRuItR4/TsNd3Fg4UU/uwwu+2F+2B0mht4PBeMct8dwpAlpFJ8i7AelQx6
	RIMJ6e6XToVJUrE1UblSZuOgp4s20Bddkzn6YIcT10wBgqdcQKMCoPLZgTD2XI8/
	uMCXjaoW5XyqaPJWKkZAWxNzcZ6bpRXYB8q6AGzlb0M7kuBwVri8fDNTQONsBTt2
	fHGx9joXW6wMmaHH6gwgrvJC+JpJqR5y+CBAhh1RbSNreI8dJOpjo/MAgvadhLPW
	e+3vpL03kWrVbiZxMF5cyZAIvSsAhrSuhOPCDUaV0hyFYaaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6jp1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b274f94f8so42941851cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613633; x=1775218433; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kbnk1Dbp628OwAbcO4W3dNKPCATjO4PL3FJbktC7gOk=;
        b=jzYzSov1Se22GjHGPRoW9YDWhvgsR0aW8HE6idKqQSCR3o9kcRQPGzpRJBtiWiwtI6
         oCl79c/Ou8amOtDByDUa7xgk51VsFvQQe6iTb4LfY/WdnNHEltEGUoshQ2OC2gWccam4
         9u8+QB+768btjA75RTQqWsuiI8H8JYUpj3abG5tNUmZzw4aawu/TdZSv/NhUOtHtuW2o
         yYP+GnKEiZoVJwTgUsZNNXshhLvp3CNU5yvgxL9Ja5KNmAblYp07iDhTYxsa/mERoF3z
         bYGQXvZF/TWdFeTYQgVx3jPpPf9Tcg15wjKet6vQevXnUpDscslIY+EAWiLEOuNVEImy
         zcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613633; x=1775218433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbnk1Dbp628OwAbcO4W3dNKPCATjO4PL3FJbktC7gOk=;
        b=DrTnM6++5/XU20dn5BmYsN1KFD/frJMICvaLLbKTHzOEJcHxdxcMiLQr9VB91A1F7v
         yEvUi+wLIJz9r/loefOamO1vt0jShoxShvDS45s+4tjRdt75Y75Gn2YH2PrvG6u+vEsL
         tBXK1o69Xu5w9MDulhPZTSgtsYS+8wUExvcoNJpiSxPsc+BmkwEylOwuiUcrPiNCJ8QG
         aAh5dTWa5dIu7WZTFDQ8FBW79dR/PI5od9btV4fWgGipibUNE5sOSZIzv8HZOExsOsVv
         xpoSWj+QY269wW1TVYUvpRRa8+BYN2fEaAozlfBMLNa2ht9B6tSY+KhY1x2biSYO1t1o
         v0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbCbQwwK5FEZkpBiRJodHqciuMKtdLlGQ5V0vpyP0VkHbZLCFtHgiEo2xw7fzC9SpMtyK406mYMdqF6BI3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+i89UmyVTrZxF4GIcG6KO2pTQchTtqrbiO+6RhFpqbuVISkY3
	CxSRl6wQ2uoB7u/cKz4XnvbhU3Ei0bflc/YFHHBCc0XpZ9DtJu/eOBG9vxZnSAriryc9SwyG7wp
	shGSIoNLMoGvJmweiacjWsFSGHwQOrhanC2DFtO/SOjuTutBcNyTcnyUo6WoZgXFnbEut
X-Gm-Gg: ATEYQzxu9DORoLophhVY50wtpCQLW9U0n94OpGYT5AYNwelwyTyomO3yV4PdOvhY0Qd
	aIiheMJhjjGr2BWRIescnAdRP6GSExAhAYJ2Jxbd8g5Pa2gy8BCNfNH2hjMSuCJ+9QdB08wLpmj
	p0epX8c6LYjVBWG27CzBwcY2fUQQi6vxrX59AlmB/tr0zkU/jW17qS9eD9tukr2FFv0x3u66Hqw
	5+WriWr5dqhqxawSz5QZfG3mt0dj5m2lJYcXZHfWffeP6QCSNVm4sGPV81wWotAmJLSuwabet3L
	OUOXrxMTMxgO9y4Hz88Z10g5L/TAOvlRAu9i5uuv+IOoD5clydhisC3rS/iHp1WC8DnpiaYoz5q
	4I97FL5wgNHd9M/mOrJqxDZJRAos=
X-Received: by 2002:ac8:5f49:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50b9958e2b0mr64471101cf.39.1774613633487;
        Fri, 27 Mar 2026 05:13:53 -0700 (PDT)
X-Received: by 2002:ac8:5f49:0:b0:50b:8b8c:f68b with SMTP id d75a77b69052e-50b9958e2b0mr64470531cf.39.1774613632917;
        Fri, 27 Mar 2026 05:13:52 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
Date: Fri, 27 Mar 2026 14:13:39 +0200
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN0xmkC/yXNSw7CMAxF0a1UHmOpBBE+W0EMUtsUozap4kIrq
 u6dAMMzePctYJJVDM7VAlleappiwXZTAd1DbAWVi8HVztc7d0Ae8aYz9tolQ+n0HbAlwiFNkpF
 THzQaNkzeB97z6eigpIYsZfS7uVz/tmfzEBq/bVjXD1KxQ7WIAAAA
X-Change-ID: 20260327-dt-fix-milos-eliza-gcc-power-domains-bdc66ad5d982
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=902;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CpiJi1wFsZbfzyH+f0CtUiZ1fQugjFswPbwL9ZRyT5k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR1hW+t3hCrFIdlWwLympwZnNEIJydLRsUgP
 Wp22ebEHnOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0dQAKCRAbX0TJAJUV
 VhKZD/9jkSAP8CRS6WYhSq26qOdmRrq2SrU5758hd8KmlWvP3T3JpqQTKsL63oHienFSdykhhV+
 5/URs8ixhi/3AxGbVt6di6lljhsHTzDIQ3Hn7iGYXRV4O04j2EjcfQEOpEC0b3SEXnFqRY8sLFd
 KlU02Pf2BsDk2/12ikJDB43UeOwx130n69ndNi4w/EpiQTMKzWc+Uxhi5/xV6HdEDE59EpE6snk
 wRjlwqF44yg5LvJr5oL7jGJ558l/YLSq/cTBNk9VHf2VmoKeqpe794HHALMa+8IP9mMAvdv+Bdz
 EiQal9Kwt8U2lJFA1BBFpMTmGy4g+3zuYH8IzDIX4mHJgM8BjM68KEjxlBwo0EQN/EIZUMGRejY
 2cYZftSMTA/jGV/iN4xIfKQhF4loHppBNgEZmInzUSRTeW32QsdmukfQamSXbVB5pZxeNDmIEAU
 3yBC5nFLM5jA0/TY/VdybzXV0eKDS/OB6TjadRDGo9BbWyrqSJLCkhl8e+PVNMXdEKY+OhdO0zd
 mvEdGeTwcJJEYx6V6lgap9HarAt7SSqh/mBdEzPy+NBJaMGzVoVsaWybMvCtEXsmfM/07VE8l8X
 j5DAEZFQA4FzGu+JdBRReYwX3qIJ8p7EPPxMU5FV/+9j0NewbTpTMHwUx4ccCVu6jBa6KR0/hxI
 1TsIlRK27cleXSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c67482 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GdvNSvP5vY06GQSh6K4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: fZ5KPKN-94VUyJ-8OwupvD3gCNElXfdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfX88xRuuu+0oI3
 qWXGJTin1tEVS2RLW8LeaygbbOqpEWaeKX94upuFwyoyt1SS5sXkI3zAitBdrmHNy+GvgBqrPgG
 I5m61ykq1sqWKSXJO33bX2tu4Q4ox9CzrH20ROqoRLN8Q6rwf2W/L979toX1VTWlGyT9wyIP0F6
 fYDCdTbFGHVpU0aFvgKNCd7YOMOPgvFuz/ZQaiW69FMXMnZejiwkXVlRq2uEjtqJ2cadivjU8k4
 Isuvc44abNNYMk8Dd7o0ZNMi1KFpH0Iy8NL/qqHOzz5mlzX4g4cdEkFSj3/F9u+3STfj6z8xyF+
 c7pH4dRaN6cXWbkAYBbHR+RBjvdoCvgS1hjdp5sdoksWmL94l6fw+4FICDq1LMIy5IWProZB9ZM
 xXahx/ZVNG3Ez0KtLsjY5D2zDqUPI+kj/6xkDq/Jd0sZwivO0cCSZiUZihh7mU1KmiEtMgeKjj6
 NGDkxGWIi8UlGFIJrWQ==
X-Proofpoint-ORIG-GUID: fZ5KPKN-94VUyJ-8OwupvD3gCNElXfdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100288-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 951BF344161
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recently, on Eliza, the CX has been tied up to the GCC.
This leads to dt-bindings check failing.

So the schema needs to be fixed. But the schema is same
for Milos. So instead of adding an if-clause for Eliza only,
tie the CX power domain to the GCC on Milos as well, for the
same exact reasons as on Eliza.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (2):
      dt-bindings: clock: qcom: Add missing power-domains property
      arm64: dts: qcom: milos: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml | 7 +++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                         | 2 ++
 2 files changed, 9 insertions(+)
---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-dt-fix-milos-eliza-gcc-power-domains-bdc66ad5d982

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


