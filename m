Return-Path: <linux-arm-msm+bounces-99380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJKQIk6TwWnuTwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:23:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3052FC275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 004FD3026D07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E3339A7FB;
	Mon, 23 Mar 2026 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyn0JPZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiCkYcMs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7F396569
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293822; cv=none; b=fOAn9VsN8xTDwYj/CBqOBjgeOsMx93xktcOmIE6F1L1zPhYS5QsL90zZWS05TRD8+fwqg+lCNcMvsDQX1xXCwrNDllgF/J3WUlHcQmu7YQxwFkMo78HDATaaTxWLmfnenXzdenXYfA6Luy56tCM/X+8ILDmJ/RjIz1aJIx7pa5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293822; c=relaxed/simple;
	bh=Uu3oOZCFpOkoRkWDCmeRJuWQmbRRzDt+qO6HK9jjmUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CoDaCvPbtfdVW0pHB4xbFmNRHk2THTBnyHSGHuhRMU4YnmBp5MN9sSYAA+y210KFNvDTc9KHrfVVNnXU71D1DWoLemO00u5kCFIQU5kJpWV0PdgN2nl7N4oJ7n0EPYCltb/fdpt0WIS7aXPxAfmMAqe/cXLIbiAJ90MwWFzCrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyn0JPZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiCkYcMs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqhfE3171033
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J81P5PpnsAK9w1ViBj5JlBbWqS27TtH4xIiDSltbgSw=; b=iyn0JPZNp3cNpVja
	uSQSs+gZnZxljgPTRHLr/307NWc25oHg0ByYMCJsP5gY4oSdHFCooqvDS/Iy2eaL
	bxUFa614FhhDPdbHmhrsF0AdTYaCa+R3Xe6YMM75Eis8sgnfcnG9c57cwF2H3Eg7
	zuCsPUswRmQAuxLl1gT/XCvLIqdI/OvXiXtei58LON1LGmPxpv8TKe3aEG0++ZBa
	y4pq8GDYCLT+OfamwltS9rFFZlAZf9a8mXaEB0V2klAaTFr/k+30JfkhPW4Y3gUE
	5ykGT/wZb3n3RNTj2LLnEkg9c5/Ww6wDyhZFREGS8NWEYnffSMAHKsB5+pEo8S02
	SMM8SQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21e8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:23:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso25298371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774293819; x=1774898619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J81P5PpnsAK9w1ViBj5JlBbWqS27TtH4xIiDSltbgSw=;
        b=iiCkYcMskZ/GjUwmrwY6Yld+d3p+DPnp6TVbNgiBqlHRz7wkr7pNoWIt24pJs5PTie
         VMFB5HehpQhgfQkZ/gCTFAAen6waRvALb9UUGvRGcDSLtcpAPT+quEggnjeGqJkgj1e9
         TqSrxQ8hhWJq2mrntAlsdqwuK2j1oLq/l5UBCXiLKBU4a7Z1OfRCbZoCgF1ra0nQ4bTk
         eSW7XEDDQIKAW+chKwR5uSGn+s8E957qfE7Bx5yjZdR/AmE2+0X9XKUKAw8wONSn8LGN
         1fGZlfbaAvW6ia9Dyc36QEPMejgP0tHP5GPrjHHGzcAlB89i+mkutqW5WHsHZpadjKuT
         QLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293819; x=1774898619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J81P5PpnsAK9w1ViBj5JlBbWqS27TtH4xIiDSltbgSw=;
        b=SRGq8r7lwhxFOynFfT9oQ+DYh245wsdS+zC8KHnwyT85xZO3sN5POK7Gbs8OkjKVEh
         WRQYsLMC2bdRxFBgDX4Q90kbeCzNqzOdHbYFe/4KbeJ8qj+8niqAqZxfQ7NL7SYH2d+v
         eaEuWccexJgLaWHluMrweXi17fkt+odReyE0GPUshXOYQsdDfQyHiWxMWihJ33RxEuqW
         YiNHT4lXzeOdpkqPLxZuEGjbWu8c+52F+MWGYh2fMMPJHEoaptVOIe5aoqzAL+6TVmFd
         NzPSiTOPyxLzleUG4cw9WqfUK+IoMEUZFLspSBYMXfPp9CTP7gYH7d5V8BUDEDnotSH0
         aREA==
X-Forwarded-Encrypted: i=1; AJvYcCXskC3D3OBKqnfizGg67xndCsvzfnlFMWxbUTAxzkYHhucRpZrDHVYf6nZJAiuw3zQ81nKD0jQK6Dhggxfl@vger.kernel.org
X-Gm-Message-State: AOJu0YweIZmvH/1geh8CHEDlXbxB+/x4EPmNmkcdQqNj6UjeKMeQ0pJY
	RIPEnaLN/cjdw+jbXMgVXR0Dj2ieDM8qLKQi1aDJVXotwFYgx7Kri1CisQZS3e6QlcYhIIDDix+
	X7KWb+c8bKpsI60d3N1WXOvpBeIt+1RijZ/+P2eXmjRBvdhtbo6Ibzye35jedPgx8vdy3
X-Gm-Gg: ATEYQzzggk6KHCMrRHspxxbc3amgdaHl6I7TbfoTtTm9hIeawq0hVrtwFbKAkKqnvuK
	A7+fEicuowfdXoaJVKlxgGHEr1PWyva8KNelLhpnGrTJ5km1H+Fcwc4E5WNw7ySUQ3gvrNFDYlo
	q0MfwsFX0EWgUKWKpECd0IzJcSEpRGxCaaH6pcjhnA7T+7Gbo1eMlvP2/fiZokSXUZVt5yvj0f2
	hRQqhroPHNnci8SatEVIeKAwzQ59PJcjtUnfyPlRr3KF3d4d5pXMC/9cJnehNXX9kbMyjK/T7qp
	Iw3qpHEW8upv0sKUr7tVPqkUv59bYNUjmXGPsSWxzHa+fXMz+Uj1vEB5GiaVbG8fKPgrhF/udFk
	7oVpe6YMhUDO4L4yN60qSsSzxwK4=
X-Received: by 2002:ac8:5dd4:0:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50b3e1449e7mr183022471cf.18.1774293819401;
        Mon, 23 Mar 2026 12:23:39 -0700 (PDT)
X-Received: by 2002:ac8:5dd4:0:b0:50b:3e14:47f9 with SMTP id d75a77b69052e-50b3e1449e7mr183021921cf.18.1774293818788;
        Mon, 23 Mar 2026 12:23:38 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644acb52sm33388113f8f.7.2026.03.23.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:23:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:23:26 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add missing msi-parent for
 UFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uu3oOZCFpOkoRkWDCmeRJuWQmbRRzDt+qO6HK9jjmUw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwZMxFPh1rwtE6LafTqJsnxSuXD1WMoUGnbv3b
 Bi5WbgbRp+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacGTMQAKCRAbX0TJAJUV
 VjzOEAC1VEm6Sg7d+2z278NDj+sFlA4JFNH8Lym1N0kgoERcqvPnH2SGJoRSSVPjDZXZjqPxMRw
 HBbB3wP5oM/n7YdWAn44+TAFchEHXpUTjPOZGmOZQjOjmem4FivnC8vyzezWhRSLNbMlDI1RzOe
 vIo14Z6dNQreOsn1QACev3Hf5ZOA6/skLPrZJf9HzVaXYi2Ot1aLigkvygqAho9lLWNkUGKsai6
 KrqpqWHuKyJqhy55EKKrESS2blrT5NoUMUxP7P8p8STslvH0WB0E3tHMZmdC156k0wUvgK5By/V
 B1soCznOBhhZWljcPm5j7/Wa4mn38oZJnHCMCVDtqqK5JHvJnaSpRc2iscFbxHeaIhkvqkT7ha6
 wsn+OTol+G931kZKdszkCZjuGtcNvlq4UQovYy3YNNtc1hiHH8GIPnAMBjiRE31drexe/J9dE/F
 3V8ZPkuCE7YJqPUtDrOq+s9s+jevgq3+BSLutTtmm/q0GsTehSbR591fa7T7Q9MTKUP2SNTDEkT
 JybhGwvk/Yo7Jr7otx+DTC6VTrw8LY27/Z5SuoeDL6PQ97GHyjZEyD8hunf1+6K7bPuRR7cFj1f
 QL1f9nidjE+vimW1LCjv006dXLHyUoypjbfr43ZRAjsuIM0KzcVl+YN7BmThW+NwUeFrhE9GcXL
 Y4at8QllT/x666A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1933c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tos59dM9S382luaoVoIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: N38lM7X0NgfdLxCQfy1SXPo18VtFaOA0
X-Proofpoint-ORIG-GUID: N38lM7X0NgfdLxCQfy1SXPo18VtFaOA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0MyBTYWx0ZWRfX7SXYHIivdC6Y
 kIo5uSW5tA5jaK2/tky5H4Hf3EBUJyTK8cqLwtWrhBPCFDnPkCfPdpItYn9rEA9s3VNllhNs/KT
 asIXcCvwVGezcYkit1+o0LzrMG5j7geTAOLvYdOlIT5GbwKXqo3vHHqWOTBrEgsKgyUFgmPGKFN
 7f4A09CO0Ipd96n28aQphmsyCVRGaNM53VWKkmgyjbMgTnCr4zXRZVNVp78lfzn7btd8IIl3tdW
 zuORd0MEoOjfAxL1J+8qUYemhefEwXyaVQdPkGaoZ38n/o8HByRPVz/4SUBZRYw2AqUB4QKAdPd
 UP99ozdHdIX8KjxnjjzKKiiSQhd3E5J3xDaX72u8Nk4yiypJw48IGP8+LOReXRkeL5E7BlEmF9/
 9IZRxrA7lj41Mb5vaVsFkU/mjlwY9oVyz7Emg8DoSo6r8arFuZC67MTcbU7Ti+MxsYeWpQhZtU/
 k140rqTTg73Zncaraaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230143
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-99380-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B3052FC275
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire up the UFS controller to the GIC ITS by specifying the
msi-parent property. The UFS host uses MSI and requires a valid
ITS mapping in order to allocate and receive interrupts.

Add the ITS reference along with the device ID to match the SMMU
stream ID.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fab603cd8e42..62fccb43a7e8 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -785,6 +785,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			iommus = <&apps_smmu 0x60 0x0>;
 			dma-coherent;
 
+			msi-parent = <&gic_its 0x60>;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 

-- 
2.48.1


