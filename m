Return-Path: <linux-arm-msm+bounces-119262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zYzjOU2LV2qDWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:29:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6C75EAEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:29:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k78hml7b;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h4z2SQQy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A067030055A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336C74779B9;
	Wed, 15 Jul 2026 13:29:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDC54611CF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122180; cv=none; b=OLuBSjVv2rPGIvQoAdXnxuS5M9q36PmqqdnroTngx8yWq3HYPo4aYTzw0pM5/yr6kxqTk2gAd637WKJGhT0M8gIM3va7vBykZYQ/+CrByTJK7Efef41/n88azouHj4ma/dSQgFZe3FnIXYFRbRmRiwoHuz4MewIINW55p5+l4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122180; c=relaxed/simple;
	bh=RG+2NhTeu2iLP7GDKQnZinA0znM+EU9zjm6IEJ0H2G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ba0lQQeMg0BWtrBG2RRst9oxrwInMa22XbJlUbZw4sMOb0V7F3pY4k0s8b3SIlX9si/3odSTzPlw234OINeXYLIeAEyyVomaBCV3mICpz0T48KBJVnEcpj3gnWhcu1DJN4YVC1MGQUCGN1jn+6Fr6xPTKtghXxM8gvwkvQz2qe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k78hml7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4z2SQQy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBctF13599592
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=; b=k78hml7bv/O8HC8z
	QOhOoVArWpIOSde0mUpi4dYmFM+n4/HcCaKHm4fAizjTHSMDRmIZEtPR38UpIORi
	E02kUjYGRfE55slqc0aYlF3ZYyZ/e9Hc+N1CtsdYv5wErxWD6a2K6v1MZ7CDLVMQ
	bsVSNwlvNpX4JiGWcBdxrR735J+aJLq8hVKw63z5l2TCyE9IbsvvLesnSP00QoF8
	zU6/h4F0UeVg1tlBb36nbTtcW0oi1XAQ9EKGBYActIZu/QZkCzI345DRYHfR7h1x
	R27x84WrhPpSFjfGUYFN5Ij/Zsd91dFS3ZKj7LcC8FLsR3/FWYCUtk/Xmw+3QqqZ
	oDnlbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60uw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:29:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so771679485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122175; x=1784726975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=;
        b=h4z2SQQyta+0SWhCTIO/DzLtj2gH4aIzZTZmRawNYVlb1iv05ksPSu0DK2DqPFrvuu
         ikJYRJadDEHqGh/AzG2ho2GgDvxl/3DKNEUmnYlKuXjU92o6a6IbHqgkVfw3P8OWk9qR
         gfhaVHdaHqp4Ex3IGct11jU8t7EPJvUDNbUzL4iZ9L5RxOWMgeRTQRfhZAsX0ChRxIUQ
         28s69nKSCQ0EwpZNVoSnK9AlNQzoKYDT8jrPzwVOyMK+h22mo1vmTCUrhhvWXIMU/d/y
         rbzt8XKEWgd6e1CimSNapwI7RD8cFZMO0/s6/M6+nTXKbFL9Fi5yUpKn/oCF8oDVcXEm
         D4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122175; x=1784726975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jytwvE4MoycSrSXL8N/TT2deQ9+mZfWatCBgM+WxdVU=;
        b=Z7GzvEwd/R0nyMOys6hweVX4Vl5ZxkZgKmdnEFqqt07zSoydgJu2g8+9Rq+HC8DHXZ
         fkSNEsXD81mgJ9+0dXBWREeVj7dBMBBvf7oFXrNCkRfn5QYe6tCynB4Kdk0GyrtpNX9g
         v3A8hQQRVS6roqdASFXuk3SJ0gSeqo21reQCR8lnQsZZ1jM7QnFju2jrMTSml2x12Ctj
         G2UGUnZVAF6Me+vNX9VrrPn9Lng6PLRx7Tm/YhHmX/WHo3gvzkwyotQkNuHIphCFjUZX
         s13fbXSDFC+Wc4sJFQc+Z3NhgltHaAvCVvHsXxfcv8G65sR6ci+LhPtpmwwwJ3LDbvMb
         XPJA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc4msShTv3xcqQcMo+qPmn4XUj9yPuoNGGn0iEwp7HlTTOPDiDzbhTq7Ug3mq/5DVvV/XH9SJZ9VwFlJ6P@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt07UAlQ535d5DBJ8vSxV/ORj+YKPEPbSrYTINO4IOUv6RI/sJ
	7QXF0DE1MuOYsa7OBm/jiiTOjecsQtK83drvXcdgmD1HbCmZ9NMjflh+VYOqE3BtytTGCZaAqha
	qVBhiKsWbtRiMTy3ayVBWPCQsOrIjLWDxgBqek3bD/8vnsJbkRjowHCxpdl38LOKZ4G3r
X-Gm-Gg: AfdE7clkwYaztWCMng9TIfMIq/FWWyCZ9skMjHJg5VbklGNaLqNS6II3Du8usJz7uNW
	ana5hfNQtfYVKdUHpUbMlabPGV58GGT7zFgLzwkufAIlR0o2o751qpVCrzRhixIfnkswGQoC0X2
	GqcJDOXxr3PX7ZCE0NIyxtRfmJFQxPxhevgMZEH4YMm1BKrPJMRZbngipiHAC3Rf6Xa4TitCx8L
	tl8+byP2BFF7E+5VzX8NaAJbMHsfwRxnEbD6LaQkG6RTsbJxr9WQy8kWfwQpk4sIEMf+MZlbeBe
	FaHzdvbcCCOUcMXpI0efskn0cA1Y+Tn/75Do4DO+aGFam5udhx2J+qymdOx8AAinJQIszQJPI+l
	4Vull1EOXrowjaxI=
X-Received: by 2002:a05:622a:13c8:b0:51c:167d:b346 with SMTP id d75a77b69052e-51e4237c4a8mr58335911cf.23.1784122174789;
        Wed, 15 Jul 2026 06:29:34 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:51c:167d:b346 with SMTP id d75a77b69052e-51e4237c4a8mr58335251cf.23.1784122174104;
        Wed, 15 Jul 2026 06:29:34 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:14 +0300
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RG+2NhTeu2iLP7GDKQnZinA0znM+EU9zjm6IEJ0H2G0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s0s3bRGOPigrskaJpqSs8szumcn7kNdh5P3
 o4gsx4E0vuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNAAKCRAbX0TJAJUV
 Vi3OEADJML07IVNxB6pIXf3WRfjJjI9Ren3d7ZUMSeFVQbUP1DQA041jplay8jhMmT97HCewTWi
 uG6S/H+fo225Jda0IfI+YRVJRV8Vo17XlBLwcx8fwNJUMCERxicuj/iplPvzMALYZSJhN5O5YyW
 iS884/SI8olEG06i63T1B88hITtgsmOR8n+58fIqyFxyDF6dp6dTb5/47lGieAX4izPRXXKiMTs
 dAGRIwSWHIlySjg9sP68razQBscVil4KBQTX62PHLVWX4E0Gqp4zhISpPffP/rB/6cCUtChc7Js
 IZjmUE+xA7OinayYkAVKOv2pkUmXu5WClGo3H/pcWVbL5NXIZkGo4MG9HdLy7ilRvSvLUGmqu0R
 VBN9SbWvrMp5LarFEV4cVw61HXIG7WW0GklrWF4v+811OaAoXDZw22te1S8UGdEdp3F5S4RFk76
 cs42IopPSB832FdkNpAo7yDaqbivEzhlwzoYJeROYChwpCGOVPE/wG3evraQ3ccWtYxHa753Ets
 ILezYRzyvx236d0C3L0XPaMav+EJNJriuaJcAf2vstBFdZD8SAU25rNlW/WARCHqGQOPAs4C7iw
 WwMLuj2qVYdqWEYc+72C8LyzIrIQhkFc4f5P2e2WEZLLzB8eO713TKelZERqwwwvsCIWf5zKhKZ
 fl3QtlEIozqVBhQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX8AEtesUGWRGR
 nJ23+3ucdAJLNz7Z163zxgDkUe1PPpjvxbGlYBvLD0DOfObv8i5mJHMLodWVdSUHLeFFZx4klJJ
 So4GMgfSfiGmdvstW2Pd6QitkK93PIo=
X-Proofpoint-ORIG-GUID: EWJnMdcewYzyPGzS03qMviEAzZW28mNs
X-Proofpoint-GUID: EWJnMdcewYzyPGzS03qMviEAzZW28mNs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX4rlUtn8TYsas
 Rp2wORJjgV76s+gTP5Z01uN89yQslZjIjgKESr55+7c7micThjPBlIWhvMi3NUcSQYRopPs1H4t
 GaKCQcNPO3nYx5HoyeAWVXEZjF0K1lpmOIvBGUygoIHv0zB0f0/EKMj7qiF34e+wb9EnXJCmXph
 fTipf2FMy42hjpxHBKDP1p1EkJ9g/Tg9o91cYfot+G+rMlwgJEDbBWmqZryN0Qf/VDGvoiIchwQ
 HZ1tRgQqnj4UmoXu4ajnd3zwwzqGIiep87qxJhE5mkdrQTzpANEsTIAij7t0vkD7ABexTiarfd6
 OvWbfS4TF1/+OTqUUknb7ticl6GuomBxcCJnH/TH+TGJFeD77CrZ7oUC0m598o0XiwWXDAa+PKs
 8SA/If472HTkHWnB3AnbFl6wSFSY7j8gIepS9ZtvE2p0XqltHoefVzynKsWVdnGJ9Wzh6gubk7X
 CsGuAL9g7YDxgyh0orw==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a578b3f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119262-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:maulik.shah@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bmasney@redhat.com,m:krzk@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:raviteja.laggyshetty@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:abelvesa@kernel.org,m:abel.vesa@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0A6C75EAEF
X-Rspamd-Action: no action

The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
index b05b0e6c4483..7a4054c9f215 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
@@ -65,9 +65,15 @@ properties:
       - description: USB4 PHY 2 pcie pipe clock source
       - description: USB4 PHY 2 Max pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -78,6 +84,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,glymur-gcc";
       reg = <0x100000 0x1f9000>;
@@ -113,6 +120,7 @@ examples:
                <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
                <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
                <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0


