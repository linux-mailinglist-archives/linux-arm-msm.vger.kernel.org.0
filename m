Return-Path: <linux-arm-msm+bounces-69990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305CB2E1EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 18:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B29CA2387F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 16:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940EC32277C;
	Wed, 20 Aug 2025 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihpJ2PAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2FD1DDC33
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705764; cv=none; b=GYkzeGkz064bTqteVWe9TJmAtrhe55rf/3VuqqGJUwV8ZlZ1J1D82NSVYYjD4yqOou+GwRTAHJYjOo9/tOKxTOif7IT2QWCVi+K82sfUsokO2NEzJjkxl7WQAhEcEUls1/8FPDRip7tOy816uiovsWzu54Ai+R8gazvnJnmRff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705764; c=relaxed/simple;
	bh=GIQsyqAA7KbSio7V6MwXo7AkPyVrGnF06m/u06KzO4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uuS2Mc1J/tYW2RGI8q5DKunv3t9nv3B/YQv6tLy80IidWxu6kvdD/MgTXXCHOLHH2mkKKov5fxJFHcHBY0L5wbXmZWla3G8/6y2z9b1hYwJcs6xNTFjgtjQ2XgmKc8voJNNewIHAv6zqWy3iPihiL55o/P+o8BO5i0juNALuHsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihpJ2PAR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so109725e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755705760; x=1756310560; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFrQIxLngvx6cPoyl+3HiPXkKAcRKG4at7HfM1T1v04=;
        b=ihpJ2PARCf+Vrvw+DcLCA+cBrSf8ECPo8AX08OXI4x9OdfUWG8VxXDYew3qaO3fZyC
         YgkDK6Jqs7oOihZU/WAbqLyDU8YzQwFp8Pptld3gsW+1V6rzabZzKlnyikhGiI76c9BS
         roz8dfQ7xYW/q5Y+uFmd7JYFs2AEWjNvg3MP29yayW4WHcKc2qM2RctZ353J4QiFXUC1
         /8RGMFr5jlnozPjKIItI9cz7cBzV+26BnM4Z/fQHiZtjxsWkILNAcjLi/T8BeLB0QVr2
         CCGBXCLaGUiGsfZeFG+XlPjdSaIxfj5F2lTcm8ETufJCqSuMZnuP11TgtAfcXUUZQYSM
         3heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705760; x=1756310560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFrQIxLngvx6cPoyl+3HiPXkKAcRKG4at7HfM1T1v04=;
        b=g2iZxyZhJrBpeCbTRhwBP26l93AVxqD/crq4hC/d0TK2x/e2Qy3rEoxBp3RE1TR8v+
         uWbXv+iyLfzcScVpr2SNQrDN38F3daBwr7U+oyexhFdcdpzXEZnwZ9/72lkQ0rffLKso
         oJ2W4/fyyuKV2Kw/5ntXqai6xh0YQhU7QlQdbszGUjn2oENhS8lawWwGeQQB6OwL6fGS
         Hzwm3ag8oqltkse/3BxhLhIwLVaf6EMV+ZeD0dvGrQgDbvLi+CB121mJ3Iov8M4SgPAk
         4cJjjXoyYawPtSdHsZizsbAITHYzvMDBiwc9YohBgv++0cveD5EdKQ7I5DrAuPPGxqaz
         265A==
X-Forwarded-Encrypted: i=1; AJvYcCXKEqcJxXp0SB59co3m5QW9kUiDp7cTEncK69rwyBZeRKpnyOrNRtPNkEvBZwDgIhJ9YTU+vitunDbZX1xK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx51/lzlddvi7EFV8/G9bKWxTEYLct9gJEg4hiszcaVZdoIWKFY
	CsAHo57Xy9Czp8gqrJgbZC7d7a0IJhJbMC+wQoQZiLaTAN3kxRu20Db4/G4R405Mpko=
X-Gm-Gg: ASbGnctqn7HrShUhCmJ2NYJCKTK9cFHZapyNy2ZDHFWlKm4bUHLV10IEFBmvP60c4qD
	7eLar1dM2cxrrsTtFv1TG8q2Mhcz8+s1gyfaDhUEyRa3OSetzkQyaWfsmd+ZsRv94+ZBh6FouJv
	5iDWtv5tFyP8HeE9WybxzkHu5I5zmLI+Ul9LNW/v+Dpyw1PtKUBAPU+1052tHG7jKLVEfllLGHK
	7YMwIEAbIHWAoQ+thbK268IqlUIwYsmGdML6NoTll798wQ/+myUQRcTdGD1nAYpmhgugM7Iwf67
	96fVv0KaSy0rQxYmZSaF5L3FqukIcb8iDI+vSAe6+wGBzhUrgH/YT9iEsWOBEIPRtZcca4GojwW
	LqkuN6VN35v5pV+YTjKR2oasFerWg/E0o1175aG90e6upAZw=
X-Google-Smtp-Source: AGHT+IGANc4/e9vgpi4rR0BoyZfY8fpTBcggyerY3hNWLCE2/SXzKZymk+WZAYmHYykbkMkpQOVu4A==
X-Received: by 2002:a05:600c:c8a:b0:458:bbed:a812 with SMTP id 5b1f17b1804b1-45b47a029c0mr31757095e9.17.1755705759825;
        Wed, 20 Aug 2025 09:02:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:f5f2:96b:fcb7:af4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43956sm8364628f8f.19.2025.08.20.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:02:39 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/4] remoteproc: qcom_q6v5: Misc fixes to prepare for
 reusing the "lite" ADSP FW
Date: Wed, 20 Aug 2025 18:02:32 +0200
Message-Id: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJjxpWgC/3WNwQ6CMBBEf4Xs2TVtFWk5+R+GAykLbKIUtqbRE
 P7dSuLR45vJm1khkjBFqIsVhBJHDlMGcyjAj+00EHKXGYwypbL6jDJL8Lj48MDlkkrs+UURnbW
 m7cpKK1dBdmehvcjqrck8cnwGee83SX/T36L7s5g0KuzIGe1sb06+ut55aiUcgwzQbNv2AVAVl
 8a7AAAA
X-Change-ID: 20250814-rproc-qcom-q6v5-fixes-9882ad571097
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

On X1E, the boot firmware already loads a "lite" ADSP firmware that
provides essential functionality such as charging, battery status and USB-C
detection. Only the audio functionality is missing. Since the full ADSP
firmware is device-specific and needs to be manually copied by the user, it
would be useful if we could provide the basic functionality even without
having the full firmware present.

I have a working prototype for this that I will post soon. To keep that
series smaller, this series contains some misc fixes for minor issues
I noticed while working on this feature. The issues are present even
without my additional patches, so the fixes can be picked up independently.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Split up PATCH 3/3 and remove the redundant assignment to "ret" in a
  separate patch (Dmitry)
- Add review tags from Dmitry
- Link to v1: https://lore.kernel.org/r/20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org

---
Stephan Gerhold (4):
      remoteproc: qcom_q6v5: Avoid disabling handover IRQ twice
      remoteproc: qcom_q6v5: Avoid handling handover twice
      remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on X1E
      remoteproc: qcom_q6v5_pas: Drop redundant assignment to ret

 drivers/remoteproc/qcom_q6v5.c     | 8 +++++---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250814-rproc-qcom-q6v5-fixes-9882ad571097

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


