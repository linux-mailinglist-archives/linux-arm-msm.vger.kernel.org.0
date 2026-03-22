Return-Path: <linux-arm-msm+bounces-99055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ck2Ig0UwGnMDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:08:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF982E9EBC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7F62300D61B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 16:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB39F2874F5;
	Sun, 22 Mar 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgtbT+yY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghwH3whm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC31A9F87
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195715; cv=none; b=ONbQfM16Tt3xzm0rUFlywnepc5q5vWqg89QyoZhOZ4+NXBW0zvQrh2YQl+w/B1pmtzCWRVjKDmVW9Uw2wcTpe3/8MDgeWlbePduLGyWEeYo2a1DnCXCtkwLC1eCze8YP4FKVIZq4JDUjEvSemCg9zoEt2PDiaOXWdkjkpSNcwjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195715; c=relaxed/simple;
	bh=jE9FNOCU8b2m2ObI02k/Oi7LT+HXOk9Tf6MxJK4jxJo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=em+hjVZlyXz0RoocPR7IYaElYNxuzhW7XRvzsJejd5r0XtN5YW2zndVOV4dQSHJ2GIekEC9KhALUJsMaczdtRwcW1YVF0S5Rd8ZyOnOiDK8y+pZUWnrFhn/oIqAG6DxIYWuTbEqUCJisNQhNF0D1bghlpZnWGxZDP9udpOcECY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgtbT+yY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghwH3whm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MFmHqk2615818
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HlCWhmkj5gP9XX0ujtsUnl
	pIDxpAr0Opxk5NjgaFC5k=; b=SgtbT+yYVxq3L5e7gq/zGDSR01oeTq4ZRB0IoF
	fVs8hyVQ0lCMqyE5iii8b4y5ziR6P6eM863CqoJlbxGQKF+fLBlp2atZnhNee9Lx
	UMpl76gp7hz02VzsYM/4zAucWLNj+leWzgdtbZTzoIvreIikpAZJ3YpSbVLRtB3o
	zFO4BTdmlxo6sVKCed4bScXx8Q3lXZBmXxtx8sid8xj7S0+Geu8urS9P2V1Xw093
	tEZ82rHiEaKrRysmUP0TLxjHMZtnHBU/LuUhKzuE22cYqEWPg203MuuoOEyshBVM
	bKewIK7dlrMKM4GGBDL0vPc6wzoQuXjqlcNY9uCCfuC5G6kw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng2nmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso19769631cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195712; x=1774800512; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HlCWhmkj5gP9XX0ujtsUnlpIDxpAr0Opxk5NjgaFC5k=;
        b=ghwH3whmH7PkY4tMls2rTSbJvm5j8u8+dY+hvDssu7V8xYqHDI3LdmrUNsYVgLu588
         HUHKpZqi6/HXs2lx8Rj56jYOuXZ78VAuaIbfbg6WO/SxgZtebyYFwpNEeGXrokaeSIXt
         yF2Mz2ea2T/I9yOlluYqYjNW2UcvOX/42dFTKFv7CtMSV/QHCBKeD+1HvUcQMg/wz/2i
         REBd5ykTdCH9dYFGwrEytm1e5DPnl6cJ8Qjixa/EAxfZ8zIwOCjjVHY87idTNklQaBMc
         G0yOu0dZQQipNdwYfzEeCyhy05emTlAaGkn5j//eHDkBc7/E2gIWeNE9cKWATKJN7AWD
         X8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195712; x=1774800512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlCWhmkj5gP9XX0ujtsUnlpIDxpAr0Opxk5NjgaFC5k=;
        b=LJmkx0bH3epAVvEqOl2py/x6gTtSy1TlKAcaqqBuqVyR1M4RHzcXijfrI+d1H9GBlb
         D8MDwpxbKKo3bZr6TCD8AkE2cwbjTz5m6uoSKtEKOqte3uQrYKUU+9gnE/MsYL6gNn42
         j9l5qzDKueHl1NLqrGbunbq+a9ycdk2g0nGskQ+sTyFUVc2UHcbesgSQs/1N+UAK8YdX
         WPXEztuPUuX2AWLCgH0GMSgUD+6VioZZ/J4p8KePFf/Yrc5vZsApSVaDozoucvpDY3i6
         8Hk/FLxuqLvwmEr2mHg2dZct4FlPX6ArNykQG++b4etWd8qrULEtT1MygbLT0eLDTnyn
         MSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjQ/GffBVL/yYKqBUyKTvsCsrw/zbihg60V+QLvTPoiI2qZhrTOxt3SA6TCUmoALXKgpWPqHxjh3G5pp2S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8rK0B19akqCZnusmxFJr/iYa/vo92Hnuw7ynHfuQlxkRLgm7l
	yMAm0oGbZ0gVD7UzNn5OQ5JfRO8wSEiSu3mwcvwL5n9K0clkdud3CW54p5oMBcg8ScVAbZL3ZzU
	qJHK4gmi1lgcudcU71JQF9RA7+4zJ4OZtT/6KhRg+Io83bEI69A3B94/JeFG09b6CtLfP
X-Gm-Gg: ATEYQzwSN+gz6pcrtVoyGPGgMaaY9eh99RHtuZJsnM17tbsdCtKEEnN5oO4a9EEFNGJ
	jrkRYLoHJx+hFhh9I3wUBv6pnfQVHOnPwxwsfexAnLJNTL/PEfRxGHjUvvXgcXELEGi2OaFzcz7
	rr3jSYr3bG7Rf724mm0+c/PiLrLl7AWz0WMJqUS/wcHNdmtATI1U0zfsMt8G38qgd267F5VYEWl
	gRUpcJkglV6THPUpqsUwc+LaTt2cqGJ9TQa/7EARCyvYFvvUJmWo0/oUpawj0OqfzzIXi0RWGWn
	fJPCiEWcRsnTe9z0b+7X++w//602OFaqLRJxZgvALS3C2Mnpgrds6jc3rg0mSwf4xUJCON9nick
	xT2lxs3lFL64wGvmyoT5Mf24R5Bc=
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr42448021cf.38.1774195711622;
        Sun, 22 Mar 2026 09:08:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4:b0:50b:52ee:62b6 with SMTP id d75a77b69052e-50b52ee68f1mr42447451cf.38.1774195710960;
        Sun, 22 Mar 2026 09:08:30 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: eliza: Left-over review fixes
Date: Sun, 22 Mar 2026 18:08:18 +0200
Message-Id: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPITwGkC/yXM3QqCQBDF8VeRuW7ARlixV4ku9uNoE2GxoyKJ7
 96Wlz8O/7ORISuMLtVGGYuavsaC86miePfjANZUTFKLqxsRxlM/noM3cJq41xXGLnRNSuKi61o
 q5TvjP5Twejtsc3ggTr8r2vcv3qxJrXcAAAA=
X-Change-ID: 20260322-eliza-base-dt-fixes-6b93dd26c697
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jE9FNOCU8b2m2ObI02k/Oi7LT+HXOk9Tf6MxJK4jxJo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP0k80jprY4ncvv4owg/ADOZo/w9eRc4Pm56
 gJzbx1sXKWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT9AAKCRAbX0TJAJUV
 Vt7CEACUNfGWmB6oAKl3lFVXuv5hrwbGz3qtmaxBcxqRRDOC2uz5K/dRqoyLQqL1Z6fRoKw83QH
 kskqOdFdlrCrG/Yl/S9OMDZLM5CskjFnYcaSZj+Y/r0Dmy8iMpBJYMdP6hkfMUxlmDJfb/i/UtG
 /7sBlA7+kHb80DfHAPPQdAH0cRirRC6/5vTCOihnf9AYNLe9GussBAhC4THiN9fAw+1sB3IvZ13
 N1+qGbHI68+0U+Iqa0J8YpkXpBYKVBphTpLpgxIFSeSFq+KCBc/CWIsxourFN1FqI1Vl/QTv3qA
 6MDucGmGAlCxOyw48W7BP6APhO3WQfS9if26J1Kqkgoxi00rNV02Q8ppoqhvOIy+NMDzXw9dLJY
 qg+LwPLP8u36cIFPRkXDzhfeJLTI8Fe8CLs1z7uL4CSNwl5DVklQnU1OXzRqQsKmniaM+LUhwGf
 dQ9G1tZfj78W/YuFxSyrKrI4EBkOIn3BvcpDip6okbRcV5+rP4DcyVA48JaXNX+63DqKiT07k/q
 9DxNCK6tJwNhPaQxNIEXCsDnGGRUNDIQOVqvKdKBeSPZIW+2TyI6GIAbxTZWRI5YXuIX0EManSQ
 QKupZQHiQ/YdvI9FnukF19Oa/Z7+lNDb6+zaHw2M+kTsXP2vP63MvYOSKBWHxOS7NloypS2/gFw
 OKtlclnggPLBlcA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: M5w5UJDnKj6G3DPgTiYSOQxgs70jQCv8
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c01400 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DjkNGMU_IkZk5lCd40AA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: M5w5UJDnKj6G3DPgTiYSOQxgs70jQCv8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfXwNvaVUN3UHqN
 reF6sbYlETeO6hGxTmVSp4TG0YNt7SzRSrIHlmcrKqUzDqdcEfYo3PdNOoRHbrfeSc5evIoiaDW
 eG09QZVu0rsWkCr3w14imdHwz/P92ZueoWtoO1Cc7iPtbED0ljHGtQPsQXJalgFgLKSJroKdLx5
 DC6abzIDpQ5CVBsQt9gcXrbS85C9mkHfeMsa/6SL0zQM+hk7YPbQSvsfXZrhrwlxzLh7r2eZajU
 Cooubor3zkmq6WI5ylQ8sF0LDYoBTG3gLH3bMPgV15922Lw+/8dfHLFC96jis0ipQLUNdew51RA
 qbbUQ5BNunnKkIjRBo5y5oTTOFkDxqjpIQCNaPSdIG270dVBZPE8DgB9RTq6MTNJ+73kVV39BKe
 qCLTl8HsRWEeWaTzomZnYVNcYvDiC8eNYTobeJbHU+kIhFhcLtsnLTRQBR7DRsmuwPKLPjwiyHf
 Jmole1VYvEOjqom3znA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99055-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DF982E9EBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some review comments were not addressed before the initial Eliza
devicetree support was merged. This series addresses the remaining
issues.

The changes are split into three patches:
- one patch with coding style cleanups
- one functional fix for GCC/CX power domain handling
- one functional fix disabling UFS MCQ mode

The MCQ mode was enabled during review in anticipation of driver
support, which did not materialize in time.

Bjorn, feel free to squash as appropriate, since the original commit
is currently only in your tree.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Coding style clean-ups
      arm64: dts: qcom: eliza: Add CX power domain to GCC
      arm64: dts: qcom: eliza: Disable UFS MCQ mode

 arch/arm64/boot/dts/qcom/eliza.dtsi | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-eliza-base-dt-fixes-6b93dd26c697

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


