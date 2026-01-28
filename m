Return-Path: <linux-arm-msm+bounces-90943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G9DEPbleWl60wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:33:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE99F83A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17810300398C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDA92D5410;
	Wed, 28 Jan 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+oRCeba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1B155A5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596403; cv=none; b=g+m2fLpWnTqRqQE27NZB+mQrEOK8yoyg5+R9F1wn5oosPADKlnGgNqqt7b2IoMzAoajFP0jwpD0RzGNUQwR/AWCDd5egb2UEnR6mCdV5ZfG2YZdv7NUuAlaWdorl2fQFNd97kjWSDe26Y5EXSnSQsu6xBVn4qfhBIcSV/Ltd5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596403; c=relaxed/simple;
	bh=9AkckLqdr8I6dlgDgVrsAdmTfOWX1yDDhCH2GGETIwY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ephapt+60iM6qebpdZLYxMExPBCaqddE1DuM8e0dvxHZeyTETIEKfrzDyo/x/5kRsxurpfY+PhSTlpSZQGjPwJ2ZINNf6YtxocUyNtcNNSh1gXBh+zG9jqbUmbdjq4BW0WGslhqoS3UFERm6Tl2QS5oxT6TrvvlXwJ/JAku31ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+oRCeba; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432755545fcso4988332f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769596400; x=1770201200; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfl2h6WtMvC4uth4uJcH1z3Hy9APzsqFDSQKZVX78Us=;
        b=B+oRCeba7dGVmIL5ynOqYL84OaPQbZUgC3c9DaSS+rp4TQXkGTrflS0s0pjYAooB1E
         9YnImHAqcxZa+Ec7AIR8kDYopHR9LcDfLSsXuylJf6a0GxjXfiuUmJdhXkB7gMdxmCBQ
         V6pFy517w4PoOKH2ynn4LLTVyt/r3Up/OTHh9f0r1o9Lwio8Nb94dXW2sPPCzHmQ/EiX
         67WSCX6kz/8uX96FnSb1bjxN7wyMlzZvLjuFOEj9kktZVFPBCIscxdfAj5NrT1ghd5pH
         RY5ntJ1jjzm5LOtC65Ced4obb6X6rToDwO/5/lLG5AOLjVmbh2kClKme5INE9uQ4XToy
         rz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596400; x=1770201200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfl2h6WtMvC4uth4uJcH1z3Hy9APzsqFDSQKZVX78Us=;
        b=rx+gyOmbN+T5zMXQPvdh/+2fA/ZNclxu9weZQR9XUL5GjnMB9HOzKgcimno/9hLEUJ
         EqaE/FK00g0sKuOdKOv0I3J1IOLzx6uwwovGwb0EW4ca7g7ltNPi6vYT/iNFJSHBfOqH
         JnW/2rBzXGXYZ1snXgZ8lKZKm5pTmTaLuetopSAk2FmHEEsLLmU6wgAK31kmUIMbhAwD
         oVcoCWWhYsQwE3Mu82MVjK+2hQSiDciVKgTVetouVclcAdAm0ehl+WX8CudrmSDWx1XK
         SnGlp73YksIByShiKDscWGAXFCr130dS1rB+OT4r/6r8o5KNrqqYblrd9YEpryEInA93
         PGKQ==
X-Gm-Message-State: AOJu0YyIIWPX1Fih8585UAukmCGDcyUY7I8H2Nha/zzUHvclIgDrf8QP
	OnhPXuhqXK/OmFFfdqlK9vSbsyf/rhIW08enQg8SS7jTnKJUTJzlmJJmv60huDmZuTfSXNR4iHH
	41qRK
X-Gm-Gg: AZuq6aK9nO6TLGytGQufpJxRC5eLr5Msi6zWCTHWhEeGIb5OBhcZGlet3EwOzDBjVES
	abjWDEc9M5rP765T0J9d8C45/CeSWHpnhQibYS/XW+jjboT7KvhQ5RQn/iE4/qOWjsO/9SjF0vd
	wrOKTfzBSpYBGvzPuZ1dG/RdgTVq3JIBYvs+ujG5yCL/3f6JaejGTchTalD7gHrJbXW0pC21ilb
	GZRf6rSt6pCyOjyUB/mBn+7hDk2glZYJ4mtTuCPurUFAcfEpOFmu0gQyoBUaKFNGHBC4OfC+GKr
	woL0gPlyhgtX1gLagKYHbag0FrtYr+Z8PjSH+OVp7GGU2Dn35eLwyjY3jhjaR5kJ7HkvI211KnK
	0/hrxOAxWCMbVJ+7EkxUC8M+KYD8ZxPnu1ADm0CgtKCYFOhi0xSloJgO3pONkMAAXgzHePVidjr
	0Of0djAp4xYE8lxTn5fTO9L6ppCqckBAQ=
X-Received: by 2002:a05:6000:2585:b0:435:9690:f056 with SMTP id ffacd0b85a97d-435dd1c0bb8mr6932521f8f.35.1769596400166;
        Wed, 28 Jan 2026 02:33:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm6241692f8f.33.2026.01.28.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:33:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: qcom: sm8650: misc enhancements
Date: Wed, 28 Jan 2026 11:33:15 +0100
Message-Id: <20260128-topic-sm8650-upstream-cpu-props-v1-0-9fbb5efe7f07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvleWkC/x3NQQ6CQAxA0auQrm3SGQWJVzEuSC3QBUzTgjEh3
 N2Jy7f5/4AQVwl4NAe4fDS0rBXp0gDPwzoJ6rsaMuWOUu5xK6aMsfRdS7hbbC7Dgmw7mhcLpHt
 7Y5bxKpSgVsxl1O//8Hyd5w8H/TEmcQAAAA==
X-Change-ID: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=749;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9AkckLqdr8I6dlgDgVrsAdmTfOWX1yDDhCH2GGETIwY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeeXttDIfNvl/Um9XJcuBIoNdEzmtMMk72eyg3c0s
 7i+umZ2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXnl7QAKCRB33NvayMhJ0Sn2D/
 9AIWn2Ezff2PKz5c/Q1vdRzWrZswx9o8hz0Me5DMo9dtL6JArXtY0Hb8MTjD0LAitdg4o6wYYlg64Y
 xn2dsj6UaU7aO66sUHCp29+lAhyrgVqa+xv8Oz5iwwxQv2ujLumHf9I4a9VZSuhg8Ay9uCEsPKNzi8
 ZDbyWQY/05jI/x8Fp3WMJ9fNJOJo94QakPO6nRNv4NF6XyASRi3DzgO4DGZTnaJDGr2rDPupo6JXwu
 EF+7toKrhf1VEmWEtTbFbldpi5Ng1uOVrDLai0ssiu2VnGMXA4XtSWaj0cDNH8AnKaKlErNVGbhL7m
 DA4xjbtHdStVZGwWzdVJCkV0CEGntgxN2tr995kdZTVrHa2nmC3IN77Z451JY0sZITimpyTMi47C12
 8Y+3VGQXQFEAjBkbhhZwxB/by1/LZ8idMBpyLM56LuQGHg6hSxpxvlQe2ssmZgN1dLayAkrCiT42ti
 Sl1EzwTF2cuY3yzu5+I4rbfjlkgmPdW6Go7y5EhzSAmZPLejlPoWHxT6LDmB+hBbUFWpQYUr6Vdc1D
 7e9zsmTZLz9Y+4epbPY46OjUYfXbgxr2kGEDdL5Y1XdrLd7j0HyAHyFM27/kBhNNb/XVwL1SC0/lT1
 xvOvWaUvPz1mJamf58xj+mPtjzBVPrvNMjfwY8oZeDuOOpn3G/kqKBB8zi9w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90943-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: A1CE99F83A
X-Rspamd-Action: no action

Misc enhancements for the SM8650 platform:
- update the cpus capacity-dmips-mhz
- add the CPU cache sizes
- correct the soundwire ports

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      arm64: dts: qcom: sm8650: update the cpus capacity-dmips-mhz
      arm64: dts: qcom: sm8650: add CPU cache size properties
      arm64: dts: qcom: sm8650: fix soundwire ports properties

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 110 ++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 27 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-topic-sm8650-upstream-cpu-props-0754ccef3e01

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


