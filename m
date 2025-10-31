Return-Path: <linux-arm-msm+bounces-79860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC88C24B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5136C402D63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAC23446AC;
	Fri, 31 Oct 2025 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzUQ0PSj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAYaSmbf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C534405F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909130; cv=none; b=pHZw6f5QCMStrgzmxVfYVLZ6insNzZqJieCstPxNQH5n158lnHGygig8iJy6GFD1MLAKBWK/+nVurgoGYzBXF3xUQWFnNgF0pWK0et7pmbxTTDU8rVwDxgQvoziI2LQJnqJW2eSfzzGWaK3bdcIc7ISzguV0hHok5yUTtbJPe4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909130; c=relaxed/simple;
	bh=rlbFRwarOM6xnyfugRGzoE/t6N2ODTzyxswtvuADIs8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qf0UEyyXwDBv95OrmzK/QRmuk8BWAKpORgTeUU2XE4om7TOObKOaDJG9vQSl1QORZjaJXrxu4uK+lEHs8XrXv6prjr0hY7Q4UASKqL8AJfGT0w377t4yosFWmCqGkqejdoza3+q8J9NB8CFjwvyNew0WXvrToO0unhYk+pvSNpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzUQ0PSj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAYaSmbf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8dL5X898808
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RMnCXOzSniEt+BA8eQK9kS
	MP6BGd4fZ2+dvmH19PIiw=; b=OzUQ0PSj8FZ/a/rnW3C7Z9OH6WWbAjkM5JLpJc
	eVVQeay5K0AoJSEbIfrQmeA55k0VoJc5a7LVXmiTgDJX2XitjovH6m75u1hs9zWf
	clV00WlGLvn3SGdN84v4WWvqIHqnsJ4QNSAQF3XLqgLeSX3BId+VWr9yM7t/FZDQ
	/6FWOwCVNT58zKc+Di0bEHO87nSYXw6E52FRqxVyV58wScCrVU+wHXO4bjr5/hnC
	z+S/JY155N+BitloWINNRDsEN6SEj1HqSs+/OtikPmO327LriS7T2X9NpL9YXXtV
	mgHLmc/NgZ083xjw15g8+oe3oIcE8jJQUEh/EiYXg9XmymaA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4gb21uw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340562297b9so1520476a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761909127; x=1762513927; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMnCXOzSniEt+BA8eQK9kSMP6BGd4fZ2+dvmH19PIiw=;
        b=XAYaSmbfzo9CPaHuG7cnWMYfFJVah+YBV1utOYzP5Ciagej7L1sp5g/cJWoxVj9B9s
         BdSDS+8+JLRsjx8gG26ZgkaXABzvY/w61ar48L/HSYzbNH4AhosDajhCGQK1urTJ+xIl
         ePg5zWRY+ZZs0t6UmgN2KT17Gl9T57kvZm+LaJZD8QktGAvjIBvU0QZqwGZfOdfPh0x5
         I0wFTB9YJxlpv6x1JKq0sm+FPfvh/l+Z76FkPSLyLe0u0HNiq5Za435vnNDuC33D4tOe
         d0rTLAb3lApwikj9RZPMChHwD7hpx/QGK1MCuA72/U+Ym/uLk90L7i+pc4lFMFqqW8L4
         jK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909127; x=1762513927;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMnCXOzSniEt+BA8eQK9kSMP6BGd4fZ2+dvmH19PIiw=;
        b=PBoistKk+gTOxIMsr9Tjjvs1LM2pNyjXW3mSKQj/nS9dPe2QWms0FQvCEqFeC4LCFx
         F7PHtVze/CRx/1l72CQ7xPu5uPkYf3swpJAKWFAueSUiolaLFwLXYDSjHmxFa1mgz8TG
         I0FEaswxcsiaZWAyJApVY2Uv0q4mXu8m/bZpFwTk37mMyGOglIWexUiBesa2N74nHEy0
         JLhnI1nqf9tJ3Ym+xpOoff0XXALf16KbOSdSLJZhtaynhDiss6pxXQ6po2bUrkqoSFJE
         dMxW9le3+Lto0cbGgcsrydERU8pq2xrdJSpeMYpnNXGvEHEF4j15Z6NGQxnYKXYrMgAS
         W2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCWMpswTzeDdoy/uN2PDFJsrGLDDpGDxmMqjBFumqLWRCFhsX//d9KtGdKQAc+buEgZngOt8NyKssqWHog@vger.kernel.org
X-Gm-Message-State: AOJu0Yybt6DtfX5BTyZFIUT7RIDV/GGtiTtWBn1dVOoA5SA3LPOCtwGw
	exL0NFXg9i8DKl+B5XHLowwtYtZ9Yxug3H9uvkXJHTbRCV7j/9uzrqm2AUUpFKdakUDqfW2h0Te
	fDD8tsZaFJp3szuQ4zjD1BgOiBxpW+OUFjVlO5RcauTnL8tJdkI2fUUQv7fT6V49Lgqzy
X-Gm-Gg: ASbGncuhaVr6IflDAkWcYZL6VZz/C+DAfNyXyBKORSEBlhntbO5CwQUFDvo8KNK0NVq
	rGif4uSP4tocE7zLpDCeSjyJFa/e2Vk9U4oafsG0rbbawPzN7dFLKeoe44LUePZRkFeWiPlGd+M
	Lg4vDm3sZvvyNxq4cJpjB3qFbi9DhqJc5fyU85L60bZhfIRp2UBSddD7/RtWbQ8PhcUjAMnxWd8
	m0i4/TIwFnu2+E5TDjROiabdnABd6RKraN30PJ3Rg57Tp+YmqJgNEbALoLqr7dONnYaiWX5jQbv
	gRJo5QwuRRQRh7CoOk7ToEQd3z84DiFmOZ9a/gwof7zyUVhoINYdHbANXQJ5k8e1wn8yWo0+MzD
	fkVo72ybKa8k/bFdT0BTxeVYX/RrXFmzGcg==
X-Received: by 2002:a17:90b:2584:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-3407f9d235fmr4253732a91.5.1761909126511;
        Fri, 31 Oct 2025 04:12:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTApuYOuTWC3uZh+zi2uxMxBgaUFFtOoqClH39YHqSv9IQ1nVNxgzyI8wdgltuzOyfitm/lA==
X-Received: by 2002:a17:90b:2584:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-3407f9d235fmr4253675a91.5.1761909125764;
        Fri, 31 Oct 2025 04:12:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d7793fsm1887363b3a.25.2025.10.31.04.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:12:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v8 0/7] PCI: Enable Power and configure the TC9563 PCIe
 switch
Date: Fri, 31 Oct 2025 16:41:57 +0530
Message-Id: <20251031-tc9563-v8-0-3eba55300061@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2ZBGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHQUlJIzE
 vPSU3UzU4B8JSMDI1NDA2ND3ZJkS1MzY11LyxSTREMgM9XYWAmouKAoNS2zAmxQdGxtLQDc+xg
 /WAAAAA==
X-Change-ID: 20251031-tc9563-99d4a1956e33
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761909120; l=8172;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rlbFRwarOM6xnyfugRGzoE/t6N2ODTzyxswtvuADIs8=;
 b=jZyA1mUBYjFVrWc1mInjQktwUHcx6+cQjn1UadRt0STn880ZZ8ezQVzu5oIeyDN0El+XhmXS/
 pjLhB46lOQjAVVWle/YIQFkQrYKvpIV9l5qcrvawurqf3hgs4EBkafQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=efswvrEH c=1 sm=1 tr=0 ts=69049987 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yKAn6K1XAAAA:8
 a=COk6AnOGAAAA:8 a=LYJiWw1m0VcFHw0g8QYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=6M1ixcW_PCWoKiWyFx5v:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwMSBTYWx0ZWRfX8jdDv1KRuSux
 nXxJsRindqbNzkXyiaEAkrJZvVEeTvGlUyuO/OPd7T818Ck2ST57FC6dDL9ROcKSroOgs5GKmHC
 5Z2kpVToqgBaWcOdK3XK4WsRlfkOjEBjdwzw9n1EBlj0/062EnZcjdAnRZvppRt+Kt4e+eKDu3F
 dRdEQ7G1Zd9HxX15PG8fjxYXKENGFMZ4dbcdF6uCSXDQ5VRGG7X02sW5o/otH0Ukh6EAmwuavmC
 gP+MdBoi4N3isOkXvO7eC8wldl3Z1R0M48O/YgcE7ptpiWHr3RBgLpSjXrzF9m/tznci57hyN02
 W4/peplcb6Qpl8UX9N4+AE5WeflTeEszJescNMtidD20vMfPDvWFTNBS+ld8cWhqO/SR/N20UU1
 k75nqT1jhhLOu90vacB1g3lujab1lg==
X-Proofpoint-GUID: 3sUqfIc0hRTtlw_9_K3XLvCqp31BOVtp
X-Proofpoint-ORIG-GUID: 3sUqfIc0hRTtlw_9_K3XLvCqp31BOVtp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310101

TC9563 is the PCIe switch which has one upstream and three downstream
ports. To one of the downstream ports ethernet MAC is connected as endpoint
device. Other two downstream ports are supposed to connect to external
device. One Host can connect to TC956x by upstream port.

TC9563 switch power is controlled by the GPIO's. After powering on
the switch will immediately participate in the link training. if the
host is also ready by that time PCIe link will established. 

The TC9563 needs to configured certain parameters like de-emphasis,
disable unused port etc before link is established.

As the controller starts link training before the probe of pwrctl driver,
the PCIe link may come up as soon as we power on the switch. Due to this
configuring the switch itself through i2c will not have any effect as
this configuration needs to done before link training. To avoid this
introduce assert_perst() which asserts & de-asserts the PERST# which helps
to stop switch from participating from the link training.

Note: The QPS615 PCIe switch is rebranded version of Toshiba switch TC9563 series.
There is no difference between both the switches, both has two open downstream ports
and one embedded downstream port to which Ethernet MAC is connected. As QPS615 is the
rebranded version of Toshiba switch rename qps615 with tc9563 so that this driver
can be leveraged by all who are using Toshiba switch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v8:
- Rebase on the pci branch (Bjorn)
- Change order of the patch (Dmitry)
- Couple of nits pointed by (Ilpo)
- Change reset-gpios to resx-gpios (Mani)
- Link to v7: https://lore.kernel.org/r/20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com

Changes in v7:
- Rename stop_link() & start_link() to asser_perst() and change all
  occurances  (Bjorn).
- Remove PCIe link is active check & relevent patch,  assume this driver will
  be for the swicth connected directly to the root port, if it is
  connected in the DSP of another switch we can't control the link so driver will not have any impact
  we need make them as fixed regulators for now.
- Link to v6: https://lore.kernel.org/r/20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com

Changes in v6:
- Took v10 patch  https://lore.kernel.org/all/1822371399.1670864.1756212520886.JavaMail.zimbra@raptorengineeringinc.com/
  to my series as my change is dependent on it.
- Add Reviewed-by tag by Rob on dt-binding patch.
- Add Reviewed-by tag by Dmitry on devicetree.
- Fixed compilation errors.
- Fixed n-fts issue point by (Bjorn Helgaas).
- Fixed couple of nits by (Bjorn Helgas).
- Link to v5: https://lore.kernel.org/r/20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com
Changes from v4:
- Rename tc956x to tc9563, instead of using x which represents overlay board one
  use actual name (Konrad & Krzysztof).
- Remove the patches 9 & 10 from the series and this will be added by mani
- Couple of nits by Konrad
- Have defconfig change for TC956X by Dmitry
- Change the function name pcie_is_link_active to pcie_link_is_active
  replace all call sites of pciehp_check_link_active() with a call
  to the new function. return bool instead of int (Lukas)
- Add pincntrl property for reset gpio (Dmitry)
- Follow the example-schema order, remove ref for the
  tx-amplitude-microvolt, change the vendor prefix (Krzysztof)
- for USP node refer pci-bus-common.yaml and for remaining refer
  pci-pci-bridge.yaml(Mani)
- rebase to latest code and change pci dev retrieval logic due code
  changes in the latest tip.
- Link to v4: https://lore.kernel.org/r/20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com
changes from v3:
- move common properties like l0s-delay, l1-delay and nfts to pci-host-common.yaml (bjorn H)
- remove axi-clk-frequency property (Krzysztof)
- Update the pattern properties (Rob)
- use pci-pci-bridge as the reference (Rob)
- change tx-amplitude-millivolt to tx-amplitude-microvolt  (Krzysztof)
- rename qps615_pwrctl_power_on to qps615_pwrctl_bring_up (Bart)
- move the checks for l0s_delay, l1_delay etc to helper functon to
  reduce a level of indentation (Bjorn H)
- move platform_set_drvdata to end after there is no error return (bjorn H)
- Replace GPIOD_ASIS to GPIOD_OUT_HIGH (Mani)
- Create a common api to check if link is up or not and use that to call
  stop_link() and start_link().
- couple of nits in comments, names etc from everyone
Link to v3: https://lore.kernel.org/all/20241112-qps615_pwr-v3-3-29a1e98aa2b0@quicinc.com/T/
Changes from v2:
- As per offline discussions with rob i2c-parent is best suitable to
  use i2c client device. So use i2c-parent as suggested and remove i2c
  client node reference from the dt-bindings & devicetree.
- Remove "PCI: Change the parent to correctly represent pcie hierarchy"
  as this requires seperate discussions.
- Remove bdf logic to identify the dsp's and usp's to make it generic
  by using the logic that downstream devices will always child of
  upstream node and dsp1, dsp2 will always in same order (Dmitry)
- Remove recursive function for parsing devicetree instead parse
  only for required devicetree nodes (Dmitry)
- Fix the issue in be & le conversion (Dmitry).
- Call put_device for i2c device once done with the usage (Dmitry)
- Use $defs to describe common properties between upstream port and
  downstream properties. and remove unneccessary if then. (Krzysztof)
- Place the qcom,qps615 compatibility in dt-binding document in alphabatic order (Krzysztof)
- Rename qcom,no-dfe to describe it as hardware capability and change
  qcom,nfts description to reflect hardware details (Krzysztof)
- Fix the indentation in the example in dt binding (Dmitry)
- Add more description to qcom,nfts (Dmitry)
- Remove nanosec from the property description (Dmitry)
- Link to v2: https://lore.kernel.org/r/linux-arm-msm/20240803-qps615-v2-0-9560b7c71369@quicinc.com/T/
Changes from v1:
- Instead of referencing whole i2c-bus add i2c-client node and reference it (Dmitry)
- Change the regulator's as per the schematics as per offline review
(Bjorn Andresson)
- Remove additional host check in bus.c (Bart)
- For stop_link op change return type from int to void (Bart)
- Remove firmware based approach for configuring sequence as suggested
by multiple reviewers.
- Introduce new dt-properties for the switch to configure the switch
as we are replacing the firmware based approach.
- The downstream ports add properties in the child nodes which will
represented in PCIe hierarchy format.
- Removed D3cold D0 sequence in suspend resume for now as it needs
separate discussion.
- Link to v1: https://lore.kernel.org/linux-pci/20240626-qps615-v1-4-2ade7bd91e02@quicinc.com/T/

---
Krishna Chaitanya Chundru (7):
      dt-bindings: PCI: Add binding for Toshiba TC9563 PCIe switch
      PCI: Add assert_perst() operation to control PCIe PERST#
      PCI: dwc: Add assert_perst() hook for dwc glue drivers
      PCI: dwc: Implement .assert_perst() hook
      PCI: qcom: Add support for assert_perst()
      PCI: pwrctrl: Add power control driver for tc9563
      arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node

 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 178 ++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 128 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c  |   9 +
 drivers/pci/controller/dwc/pcie-designware.h       |   9 +
 drivers/pci/controller/dwc/pcie-qcom.c             |  13 +
 drivers/pci/pwrctrl/Kconfig                        |  14 +
 drivers/pci/pwrctrl/Makefile                       |   2 +
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 649 +++++++++++++++++++++
 include/linux/pci.h                                |   1 +
 10 files changed, 1004 insertions(+), 1 deletion(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251031-tc9563-99d4a1956e33

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


