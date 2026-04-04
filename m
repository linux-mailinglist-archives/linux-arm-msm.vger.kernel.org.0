Return-Path: <linux-arm-msm+bounces-101761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEJzGRXg0GklBgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:55:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65739AA7D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 11:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B693A306B096
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 09:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA913ACA6E;
	Sat,  4 Apr 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlOuKGTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7iA+z1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26A3A8748
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296275; cv=none; b=cW3HPJM4bYi2b9Jsn9uUGbSiXD/gjqyG3PqHEZHY4SneRNRn/OW6EWJBrSI9qAjGpE7sGcQJJNc+xfN/8BVpB95CjqH9Wyp5hPtY3l6XFddzt70vab4NnlA2I7aeim7TkWX11u/WSmxqwIj9vSLmNRkUpw6qufmtyjHJW0Rq2fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296275; c=relaxed/simple;
	bh=subr1r/NjBqgxGfDZAex/s5p8C8AnxshMOdsb7dnhLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FjVMnxbX+k8n08p7m6vE2ioNx2TlZPih5viPuLrYodbXP7oZShfEPoi8FhRv88y57CvYsQnDFQH+nGaLvwLDO5AeE5U/wmG1tQ/t9lq5P2uuZqUlZHJxmfRUdDK2gUhTao/KDiv69dR3NHEjUlpmBdOD/3kCM1X38YSn3doomKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlOuKGTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7iA+z1u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344lft2919311
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 09:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vhrV1gV6/mbGaXRde4PoZk
	/z1UcVJp7UYj5vSm2/nZc=; b=KlOuKGTtJ753RLOcS3ft5UlGmbYpJoFhnmQWFZ
	3edRxONsEzN2vhLrTIXSxWGuipTGfC9zA3lMr1l+PlIPPTrEl8Fy35tZJOJjwQCq
	9ecA8MjWSFYjFhLH0FvPrausr7XHKItc5JuyM+1TF+9k5D8QHN8ppT8///DXWQ2Q
	Qrq28SQEp0d797gnAV/Sfe/1Ss3YgpEXf1UvBcYVCwwotellCK8tazlaOFlrrjCV
	l2kJk99wD0iIGFVSDBoP1GPUwCZXmNLkIL0LoUKKfexdhYnfKNjW5sbUibWRbvcK
	W4KVMNapLHv1/JVhPiYMGmWw+oMXwse2je2X1ETCooiB7YGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux88fpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 09:51:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b802961ecso33147821cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296272; x=1775901072; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vhrV1gV6/mbGaXRde4PoZk/z1UcVJp7UYj5vSm2/nZc=;
        b=E7iA+z1u13M6oDPYa16tMu+ReT7BddwEpCFH0RW6VN/W1lbCOiW1s1N/Qgol+3/GW9
         tGwbZmQeD+y21DOiJZ24LDSJ1t9m9BkXha+9jB/EAuk4B5kuXtqBeCUGT6mgGEXG983i
         q5N9I5hHase0ikEzS0vuFqbBp1BMoAyYsG/F3+2l3flBJaAIXYhvEy9OWwauvp+I5sKr
         5B538AhQ4QVUpZTfnuavWetK5C2tGHzCFM7FzXbtPNGru1ED1w3p7U5XgPZR9W3wo/5V
         nS0/2kBWx+SrWXjcGxpDGLAzpuTIsYdkO2SY1ul/ZS8ZtNEFKLZx4ip/UEYjxviKKcgB
         gIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296272; x=1775901072;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhrV1gV6/mbGaXRde4PoZk/z1UcVJp7UYj5vSm2/nZc=;
        b=ZzFAnoGjJqyy6qD52+5Ja/3dxPbcruWRjLllvmLCaXEOHFPeFgMSFkatVu2u6bu9jd
         AflbxPobib6Z70wgjwDGXu3AF+kXpjWoCA8qwFZLI+4F8Kx2wZLmuCqNs3A9Lzo3iRxk
         UFtjLdliQJGE9Y1TiYK6iiSx+jOBO2wT53X5mN69d3roZbYrtKobMWmcz5L75z31VaUk
         5pNNqNPxQfW8sLDPVpEaGPLa9ExfgxdhMZTUSNMbilI9T4DFskA/5keRr4tLMWlbl13J
         8ivcrwyV8N4h0b/V4StNJ9CIJDNcJktiKjnqEwQ8v0jQnNqDHHfNybkHoY/+ShTXDIkG
         MnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpirPfe2ElgcXXyEmafOvj3va8fJYpTJkY+nO/B1D7M6KrTlIvxY8+hdunBb4oJA0pDzEriL3SLP9gE+tI@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1mD8Vmr5FTeFG/HbpdV6YFqE499KSZ8BHira2N8LzzdHWY6s
	HgcGqpXL0DQORfYx+eJy3UvcVfvOb/mhfcB7x6aVJPFxt6Z55uBDAOpx9spk5gtXTFerQ51Pfmw
	tY+elTIWIvaTT3LC/HxkkadbiGgv+W/ADNKeuSGKoN4+WK65O+JcQ3xYjSoYkSW/V+E7k
X-Gm-Gg: AeBDies3/29NFurWWP5l4ZVvfsxv5S1sYhhzKNhLgxfR+J50fiTbShZ2mK6lWgOFLKC
	/hmnwkqO8DjVySy3hr8z8TZZKxB3TZJQ2TAvW/QOXWZ0JYeYmowfUQwJulbT78FkcZ0szmwiI3g
	K2NWxOJuURgVjZTFVOup54kfU4xflUVBEz0AIJBhpqH6RQC2xurLX0gINzkr9cyjKRvzEOzckGQ
	hPR72oOy3aTJN3up6tAGVmncgSL8Hm/jSOgD97LwdpcLX5kvcHPDcYxbhODtEKBTzqr8+08xmCl
	llYa7Spocmwyl4qXLnQI4tSldR4IcrsD+bTPNrYTUElKSb0b0z2tIz/kiiQXvcWbCKi8MlD8D8I
	jvGYW00yrRmrlrwAh7YbAV4NrFsX/ffSBPT05NZ1zhb0y
X-Received: by 2002:a05:622a:244a:b0:509:1949:7b36 with SMTP id d75a77b69052e-50d62a1a466mr89117641cf.30.1775296271770;
        Sat, 04 Apr 2026 02:51:11 -0700 (PDT)
X-Received: by 2002:a05:622a:244a:b0:509:1949:7b36 with SMTP id d75a77b69052e-50d62a1a466mr89117401cf.30.1775296271310;
        Sat, 04 Apr 2026 02:51:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Few dtc W=1 warning fixes
Date: Sat, 04 Apr 2026 11:50:59 +0200
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPf0GkC/yXMywqDMBCF4VeRWTuQBBXqqxQXuUzrFNQ2Ey8gv
 rupLj8O/9lBKDIJtMUOkRYWnsYMXRbgezu+CTlkg1GmUZWqMCTBn58GXFHjizcS1NbUzgVV64e
 FHH4jXUPunt1tmd2HfPo/wXGcPhgEy3YAAAA=
X-Change-ID: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=subr1r/NjBqgxGfDZAex/s5p8C8AnxshMOdsb7dnhLA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8FZkXQl5YDcPuGr8qJLXAafCtXHXTkLpIHZ
 VqAu2aA+t6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfBQAKCRDBN2bmhouD
 15rjD/0QIKz90jyl8jl678rm7NnoaZZ6IilgfgesfvoyxXr3WC/a+CKIuU3T46Ww2QqXEOw4gKy
 +46h09fKyGWPbJnjX4yHWS84nxbZfS7RJkkvVRX27P9T/1OYfOhGSmaCEGY0D6oCn9EqmEORHmn
 FDfGKFwqCTV59rFv6sX4UC8ey12gtnx7xOw0KKmYKxWtXZ0uy9h++CPp9WAISfv0AJ2e7QEeLUV
 vAl0E6BAmQkmQzNeJQUEUr/ZHIJNXWtHOTod8p9i63Dz92UFZp37TeF/tvotJHoi0P8GjMMHeCS
 f0VCr/epL/qOiI4puuEoEy3LuhFPb8NYniutV/DdQmxYI5ILMezgNwwZkh42OcoUrG4+hpv+Hvv
 U06gVNdpIhXMW7IYN0c0JMOB8sNDRQ2z6OO1VGBmnJopZFv90q6xOvAZVjkXbtF0HEt3vdy1TDT
 tGIXlJKOQWq1yNRwTgONsZBvjVL7hRAJlM6niF/f+bkn63L6N9Ho8uCGZrSrwErSbuy5VNybFIz
 u2NjNJ4ABBTDaAFl5ZsXfH5WwTKqfRSGX2v0ZC0XSS197dHNlN/J92gSj+HWT0lmJ3dJVziUoOK
 UT2bn3SDb+7+WP3ftPtYSB2t1353GUp1LSgtg/J+5QZwmNFJjmk4bAjmoOn/FlJ7h1v5OjAm8tj
 Rt1E7rA2cjuhB6w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Oli3hwLxtQxWXVYtXA8bwVdX3pNMwEZh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX/UrhE54599g9
 SeNu5bYogGqDjO4N4MFIc43EcZaxTH+a9edtCjKAuROm/h17rBrfnlk8/kyz/prUFkuGI0tIkhk
 Ama1Sxj7Q6/0cm9dfeS43QPpmQgo41sS7uvlw0z726nsgzvTpG272cCipjhwL6TGUyfxyAKvge0
 iw52pxxrJXPo+Yn6WSZ31WkAlRuNbK97MnX0j2WccTIRZizwTXJaeAe7lloPlQmVYnEXzirzeQw
 kNDWfMDiDLaRWMw6nziB+QXLa+CcPsrp4UWIbDHz0DDI4JSPPE1lofM1Ge0oIB7U1rrMeu6n7VN
 +6cj6x9KFl0fEe5zecHC18ujuBW5Ej7WhmellQ29j+3dxDy9o76NnG80zlzUlBrD3X2QaOJ5pcF
 Du5DxFhhctl2Lp4Jrls9JMOE0KJNF9c6TgbqQjKV+IjeTLS/LfEgfr691Mydu4DEGAashSvnXnz
 mEd8JXhoWOi3tE/xqgw==
X-Proofpoint-GUID: Oli3hwLxtQxWXVYtXA8bwVdX3pNMwEZh
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d0df10 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KhWeNy8F5nQL820tRQsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101761-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA65739AA7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Not marking stable as these do not have actual impact on user, but still
warnings are not desired.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
      arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warnings
      arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
      arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning

 arch/arm64/boot/dts/qcom/glymur.dtsi                             | 6 +++---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                            | 4 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
 4 files changed, 11 insertions(+), 6 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


