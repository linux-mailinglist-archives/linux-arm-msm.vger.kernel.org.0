Return-Path: <linux-arm-msm+bounces-86559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61642CDC0C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A7063031CEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4CE31A7FE;
	Wed, 24 Dec 2025 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRiG84RN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvuDym8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE21B312835
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766573630; cv=none; b=VX+r+ObYZVPxA7VO6ZUH1eELnks4JgpQygf4/fXdHwerKqPU+sOe1Zen8+4mCfPIZMKWoWnpadOiMUzfrJAM7uDjUAu0tFo8SiYEtE0qsZDqW8cQ3rywIAi7qy4ZYXg1DpmYvDZrFondFHkywLsavW8Uc80/SZVGqr2ruOKZ8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766573630; c=relaxed/simple;
	bh=UEqwWgA4eY1trHsHO9E8LHZDjJ0i6VTelWd/QktAPfk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d69g1HmTYivZclol/XKi/GMyFW3btLOIj2b0Qq2YuL7U/+W+uKMqw7rI+4H9MKfimP+qg05hfyEdTKwn7Gw+4ovhXA5xV7YH4Ne4ie54b0h7nwM6LXENYYrr63+LWHUtcYXHxDGqNx36niET+P58lFcUcpEBnGYlp2zwR+W61UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRiG84RN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvuDym8s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7xFZP721297
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rieNRr2oJhj28iSYb1CzIg
	qJgKQi08tHB8PfRxFDRCA=; b=BRiG84RN7bl3xX391ojCSvhkM8FnI5cZy6TwTj
	Qby9Sgg6TKk9NBwezFXqDonoBgJOHJEmhXQDhRUlZkq5LjhaLs/9osm2qwa8KTwl
	eEc8XCtpGfJy1fk9m3DgTMZgskJOxXudbRtKy+7yIV5meSDUUOQiVHY45COpNBWq
	AdPg5C497ebE43WEXht3AxP9Jq9mX8HiOQmuoVRjvDpfvjqXJIGprCwxPnqxtXim
	guF6ZtsKQ3fyON+DuDhkCZWWFKRiJyxqh80aLRLU7+uKaGkRqHBOkWhF9C67lXdp
	FnzOnuo4vL6NCeVKrZYd7pYqmo3iy8UM8pdhWYEy+Z/KmP6g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mta0ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:53:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee21a0d326so35093331cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766573627; x=1767178427; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rieNRr2oJhj28iSYb1CzIgqJgKQi08tHB8PfRxFDRCA=;
        b=YvuDym8sFHOizNlC12WDMuGExdWDSgAqO/+y0BY4LmjsnB8dhdGlpQ64rphrqG2G7S
         hQXOl1K1oTf5OZIy49hJNvpY/ZFHQQlecDrYQWHieQWbOBHYKwmi7il/0hrVhllFO5jJ
         e2ILtSO9KiP1oOlorJ2a7i//lqp/IjLUHRltIzbiZ/HnNPNlzj+VQ69p+vzp+/CDo8ma
         2JCvhmT+wI29jff0EIPOC2tG3IEOeUfdVkprJZCk6M4vuNwYkGMdwLsVd98n7q5yjLML
         8qzPSfJafGM6cCrFzDz5/qBIae9RSeP3xV4TUaPlc973Nqvq3fAFUFRkLkEFGTNXPVQb
         nuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766573627; x=1767178427;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rieNRr2oJhj28iSYb1CzIgqJgKQi08tHB8PfRxFDRCA=;
        b=gw1JMJ1WfR4FKRtTKpL45PoGw98qcOz88bCp/GrV+NeIthXhiBk6VDe35l4acOb9BK
         peGn/fyNvuuij35y6EShGwWI43Y626ZIC1hMaqoKou6j4yftn8asLSH7K8MsVps06GEv
         L9jJDgv3W7E8HJjXSqpJG0RsG/+5FIs+6fCwwvZnArB4pj38YdoA/spUX9wYak5unlKT
         JQG1w7yt0DYy0FiFn+f9vFG8jLrR4JzT62IOBcQfqa5RSlECCHB6Z4TQXeP0nivyzymI
         EVew1M4DcnnKfTZidK1/52eFPKgYw1Dc4zkXSXcLRQIsP4hrJKZMJVg3Syucz3845vWH
         24sg==
X-Forwarded-Encrypted: i=1; AJvYcCWg6ODHlJWghV5ivoiTNHT4D+TRHUAJYmXPRvlkmXyWxAdPDqqNcm4H6yr3N7KA23zYLEPTrdEqyG2uLuUS@vger.kernel.org
X-Gm-Message-State: AOJu0YxlcKxBFPpEc2L3HeRfdpeLeV6/FGsEJAVfs0I0AjQNIqYubBKP
	F3/o253U0aPZwUOUyINWC0bIvGYdPRsNFYaKQdsIilhQ9Y9tuv62mgnJE51lyA0FD41FPkbflU9
	mY7bFuT30242ORiRxCicju8aSFl//djOgYqrElzHCtHtCuCdrHnpmUMROcmKnRQQ4973z
X-Gm-Gg: AY/fxX7JB2agJDBp9Wdvlo8BKYZSmUH9Bi1zKxQgOzD9c6go/z/boI7S3yVhtEsG8t7
	ctveIDmGCBS2oe08NPVVVGltGfJChumzcbmcvFsCViKFGn64D97/JozpJRby0rrMGq+nxX76o9/
	6OtlUIt1ujaMvX62sw8fDr4Gt3wc/AGIzoyIoSuYGcr/W8eJsV41fJN+4wT4eoklXodkLpEyooN
	iDJnQSi0JiqHVJgMIAlzOMZEzo8Da8PiFFj2Uk/sEVpARKCG9H4UColdoFXQ7VprFraiMBAGSM1
	XC8oIq2QJSHJHBBrorL4CeAHyv9bj/E2dqT5wJmiOYXzQdbrzHxaCvdi7LRkK8aN3OO0X+mXbEJ
	dLm3rbX3UQLjiYu4=
X-Received: by 2002:a05:622a:4cc5:b0:4f1:aa2d:81cd with SMTP id d75a77b69052e-4f4abdb8a8emr240490231cf.65.1766573627121;
        Wed, 24 Dec 2025 02:53:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETazEDbIJBda+GTQOv1dPkraEbLtIPmiNvRi1Xo42NQLnzp14Ln+KWlN/ubdXGJHfrZEKtkw==
X-Received: by 2002:a05:622a:4cc5:b0:4f1:aa2d:81cd with SMTP id d75a77b69052e-4f4abdb8a8emr240489931cf.65.1766573626483;
        Wed, 24 Dec 2025 02:53:46 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab86cesm1737562566b.19.2025.12.24.02.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:53:45 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RESEND v5 0/3] phy: qcom: edp: Add missing ref clock to
 x1e80100
Date: Wed, 24 Dec 2025 12:53:26 +0200
Message-Id: <20251224-phy-qcom-edp-add-missing-refclk-v5-0-3f45d349b5ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UEqwWgA4eY1trHsHO9E8LHZDjJ0i6VTelWd/QktAPfk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpS8YuxWVgYyB+jUMg7b1RFEbY4P4Sb1KSxHbhC
 mqlnZRveiWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUvGLgAKCRAbX0TJAJUV
 VqYuD/9fo1rl9jefHGu1DOuP1zCkKx/VCFfo11G4rK3IbF+SvrgGxuhjJt/JTS61IlY9aYUG9Aq
 c6KsVkx9AOrudP9CwQmwyBLsUzwP6fLh/id87Jsik4nfOtKOhIXUFnwKGLhENA3115vwsClW7gm
 OWnc4KgYGRNCusTXGj4uTLnnkA7Dfu48sozRXxX2lkV9XsxFCSchhoXtvsDnvPrb6WebPRJLRAt
 2vSomz1pKG1UBn7SkFYktcXi6iv4jmGBQO1D3GtFmDfHysUEdMaqCLIOw5aMRy7Cqa+GeTOyEV5
 ob2WH691Yl5oZjQ7dGWMr3DDCFay6N1DYhgZl/EWsoJAMGdhXH4VHF6vUcQwQT+sLjfxIcw/rXv
 J+iPdekda8KhW+LYlnwkbwRoEe0ouL//xmt7D774kVA3OP6+1ETQ0QUfAL9X3TICwEq41bTdr40
 +2JfnqOWmanzno68eZJaRnrnrojtYGxpK5QAf2ec9SELNKJ9qW0O62qHaYP+JKiXqxNM//iYoUA
 /MIWnZdumi5eXxAzOyHCcCwCkAsDktL1MgYD1EGLPIPYL9PTqz45Ad1tN31m1cIzRynIXxyBKAq
 VMbE3J/HmRnMQo82VT2QnUrh5Bv+auNJC2STZu6DvYaFGThQBIfyIru+S7nDOa1TCV8yBSKU1pb
 r/nkegwmlCUd49g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694bc63b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=n6KyKBFS8jaI6nepwJMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8nb3BUgv_Puknxeu5wypwv7cUwJ6-_zk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NCBTYWx0ZWRfX/nBO8+VjNLIP
 YWl1CVLXDxWdqkLvaiLJsRONgiumzq6v6tn1WSfOSawtFoKHyoYJagi6emZTGyKjh8Qa3i/ujWq
 PuGqo4mjbFT8g/Btk8Wzpmsp+3gW97w2DiJW7PXmvuQXOb0ndkYiK30QZWZrHKd7MkwvY+/Tm4m
 fyZ52d42tKjZmRNC/9JKX2zGMERRiqW3jnSc4xapmX/BzVKS/HpGaBdRKgMzIpwUIjW6NpxNLOr
 ABhn/CVpWDCDWCSN5dFQA58o0FYxP8Bta4HtYnuRsO4FgTaDbLNBUGtTP37I1WpSn1TD/tpJHSC
 4YNJo4PIYTcImhWXMN0eUIkVFZKITL1mAqYHhNrJFnOqoOoPU40rgDAH5pVOqRnBpNNHsMaXJox
 u18xgRYtPqecFa+lpR4sx3NtYVbV7TR+8Z0gvaWo8R/r3zYSj0TGXuPoFG7Ifsl+WzhT0I92sfE
 PTvWfefmUNkBoi7tPiA==
X-Proofpoint-ORIG-GUID: 8nb3BUgv_Puknxeu5wypwv7cUwJ6-_zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240094

According to documentation, the DP PHY on x1e80100 has another clock
called ref.

The current X Elite devices supported upstream work fine without this
clock, because the boot firmware leaves this clock enabled. But we should
not rely on that. Also, when it comes to power management, this clock
needs to be also disabled on suspend. So even though this change breaks
the ABI, it is needed in order to make we disable this clock on runtime
PM, when that is going to be enabled in the driver.

So rework the driver to allow different number of clocks, fix the
dt-bindings schema and add the clock to the DT node as well.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v5:
- Picked-up Bjorn's R-b tags.
- Replaced "parse" with "get" on clocks acquiring failure.
- Link to v4: https://lore.kernel.org/r/20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org

Changes in v4:
- Picked Dmitry's R-b tag for the driver patch
- Added x1e80100 substring to subject of dts patch
- Link to v3 (resend): https://lore.kernel.org/r/20251014-phy-qcom-edp-add-missing-refclk-v3-0-078be041d06f@linaro.org

Changes in v3 (resend)
- picked-up Krzysztof's R-b tag for bindings patch
- Link to v3: https://lore.kernel.org/r/20250909-phy-qcom-edp-add-missing-refclk-v3-0-4ec55a0512ab@linaro.org

Changes in v3:
- Use dev_err_probe() on clocks parsing failure.
- Explain why the ABI break is necessary.
- Drop the extra 'clk' suffix from the clock name. So ref instead of
  refclk.
- Link to v2: https://lore.kernel.org/r/20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org

Changes in v2:
- Fix schema by adding the minItems, as suggested by Krzysztof.
- Use devm_clk_bulk_get_all, as suggested by Konrad.
- Rephrase the commit messages to reflect the flexible number of clocks.
- Link to v1: https://lore.kernel.org/r/20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org

---
Abel Vesa (3):
      dt-bindings: phy: qcom-edp: Add missing clock for X Elite
      phy: qcom: edp: Make the number of clocks flexible
      arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs

 .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 12 ++++++----
 drivers/phy/qualcomm/phy-qcom-edp.c                | 16 ++++++-------
 3 files changed, 43 insertions(+), 13 deletions(-)
---
base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
change-id: 20250730-phy-qcom-edp-add-missing-refclk-5ab82828f8e7

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>


