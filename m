Return-Path: <linux-arm-msm+bounces-114086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4yfGNRwgOmqW1wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:56:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 865736B44EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 07:56:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kvZ+qfxz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gD1oWtBa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114086-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114086-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AD2E3017527
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 05:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FAF3AA9D8;
	Tue, 23 Jun 2026 05:56:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182763A9870
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:56:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194198; cv=none; b=o8cpPRTfeUI8GdW4YtnQOOH7KC3AVz9uUREEbEZUJ0CJ5Fbe3uOL9ZHVwpxhxxrMFsrDs5rqcbmreqL35pRsJhfCoa/OT7TJKoCisFbiHMr7DXuZXTaLMDYlcXq7tuAj/VDeEkn3MhLGJuKng4Q9e8SwPrnUefhI3Y1Ii/qKJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194198; c=relaxed/simple;
	bh=38hp3yau3RDTeW0oghznzoTSMclkrDug0F9GSJUr8b4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPliQ0/C/N6qQA+dezYpSciqOuCLIh7XkwobKR1R0MATcs8+biFRAqOYAvQu54+MfMw+RPmdKtgJ3isekxJsfOxJs1PJBvzhiX8Eq0nxa5lG1x38aaZsh+2Rul0+i599Ei2GdbkZOdGY44J/CVx4GCOZtJTWYqEfoqVy/4Ld4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvZ+qfxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gD1oWtBa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N0kaf92766208
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza2
	2wRUqSHM=; b=kvZ+qfxzblWnPpLzCCUN9E6wVvShPr31cBpABbm6nK4SxP4yyVI
	GjXxtSY+TL3e0MgPrvX0cH7ZjE8MAEJNwma7kjZ4L/57I78NgghSgubLO9UkYCZs
	1YuUzvDlB3QKJ4FLKO/bz25JQMLtFi4b5AefcIm9f+nuk0oidXBpGvwEcGH0wNZm
	/ny8ObuL5YF4XGRr8AVJRrCTta2Mz88woNVWYo5ZOXONjePyaphg+jW0xibatXYx
	EoLC7Gr5J6WRP/CFOKaThyLTPgTljERJIBjA73xs24GyRCqFlVaVaC5ysVlXLacL
	n2Yj7PSGhHvXdzIwWxBnlSzNnAs7QL/PtRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3ebbnjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:56:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158e75cbc0so863918285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 22:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782194195; x=1782798995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza22wRUqSHM=;
        b=gD1oWtBa5tho03gSlYwkxYqMkcSqJ10K0Mm7BDvhi3p29x4RONVztMnejfc1vFdTwh
         ua9GRh5XY/hfeMQ2W16qe4niUNR2y8/DLK3U39axJX+aWL4x5xu5wdVL8ssqJN/U5AGV
         rUg2GxLndjADBTSqXyKVf1T+RVqc3JLsoIzjinvG1nwklVFjNE9iheF5UBAz8dzPXn3C
         lRm2QrDsTuw4BckqFbbs9axRrZYflNyw2lHUu/NrE/MLifiaL7RNrCBlBfNTu54wXpdh
         ry7Mhn8m9dshlwxTSO/axLxJ4z+utvQDu5hAOSEty+VFLo09HivSElW79oVC3y9ljVV1
         W6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782194195; x=1782798995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUkNBK1opUpsH3sD9JrtSJHZXqqd2H2Eza22wRUqSHM=;
        b=Cc31Pyo+LLqHoW2NPGwgTWNDzws6pDNWMikqKcsK8jz49jEbIYRSAUQw9UmH+JhtQM
         EnTP8XN9buZmfv0MKacUzN7Ft8O27rDnp4XXx2qB+WfjR2+P08i3y/XxsAa6RBuxU8aL
         UfE7zZupcSW47pmoUAkanEUM+Qr8nTZvXn26ZcEQsrTHid3Y5zlTgVNNB7xUQpyrHrV4
         49neAIPlm9rJfwE8RT8IlFoxc8al/5oez42DImYN1E7bz1pV+CgxOkPgJ2E3KB8I2lG1
         F7mUPvuCWOsu/T03I1KdQ6+nVcVx7ZvsVd2j+eEneU32pRP42firNZvpdFehLtfAHmxs
         Fzrw==
X-Forwarded-Encrypted: i=1; AFNElJ8YuripQlXvtuXDJ1Zw9Pu50jFZiYfvB8E1sYoRBqg2gs5v+3wOIYeZHb28Za93qekHh0lt4BDtb8TATmwF@vger.kernel.org
X-Gm-Message-State: AOJu0YxDkL/JCZL1xdoys8lVPZSd1NjZBA4AUuXLUCYBIJayk/dfM4nY
	wLkmBDJIfGTifY0LSBiwEiLpxsGor1pe66T+E5K+5dhjpZwW7GyHKzIELhRvKV23YFiEMYWnuEX
	kyTplksfHQA0xBqp6RrUKlWYkcQf5Toj7wwlT8nKsRhIvKmQBn0w/GMW1fJ5Q+63wPVnt
X-Gm-Gg: AfdE7clhR9Uv3pThqYZ//mFFhyvpS64RXBvJbA/jtVXhkUU+luflaRs4N6Qh11Rikuq
	VoJicvySBkh1/ohwmmItusG211+zXDfzbw89O5NBL1CQZLsK47D/jLUVGBDLHJ6Jg1BPfF/QViG
	mSQ310O4bghjKGFcwXksDLx1XoPv+JzifZvPkjOAWn3GDdJSxtiVV2vRZPP2D9jREgkxSw8HoRb
	L1FFfqvuvL+zLhZ0TULYRLLj38ElgZxORNrkb7eyY0D8WVyoBv5CX21hrtowtKTP0pBjGbEOxyy
	p3Nq/NPEz4XF190up73qbYa3ZUxu67Y5dHdQUBy+LH4FlALfHrsL2mR/n93GaulpnuE5Cy2Yr0U
	kyFh4uFA6rS8xnuA4J01xJszyY68=
X-Received: by 2002:a05:620a:4481:b0:915:d32a:1cba with SMTP id af79cd13be357-92646584105mr267943185a.27.1782194195077;
        Mon, 22 Jun 2026 22:56:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:915:d32a:1cba with SMTP id af79cd13be357-92646584105mr267940485a.27.1782194194509;
        Mon, 22 Jun 2026 22:56:34 -0700 (PDT)
Received: from quoll ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm472730495e9.0.2026.06.22.22.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:56:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 07:56:27 +0200
Message-ID: <20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=38hp3yau3RDTeW0oghznzoTSMclkrDug0F9GSJUr8b4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqOiAKYsNS6tRKh5vJxix7/ly3bWTgUxwiqMBSo
 F0mmQGmFtqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajogCgAKCRDBN2bmhouD
 11mQD/4n+LkA+3kQ6RSk2nVSLPIh+GVx1iNsnmEBK0+sjPsuWzEyhtFCkt4QTnaac/9wzAzM91Q
 UF27QIyy80KmCXPSBAXSGaD7G9WOQ72IdPBOU2liUucSQ0qSdN+oyd7UK/l8A6jGhJzp57sqBol
 gX19h8Byp1PVTjJVSBKpNKoYJIYCiG82MqKA7gNXGXL5/IDODVDVsneNhoJS+Mjtz7cuPfu5YMk
 EvQPIXCGNRWOxnGuihKh7O9JnfaWxXyzW5LGPWBiSEbQL/sZiIV6mKSEPh+psP2cSH/cDlTK7TD
 jcHuAHHQJmcT2qYNbLx6X9lNQf/9McOngnRHGpTW/82sPvg5/e1xhxTvxesJayz3vw+pIWq4NNN
 3R9beskLV9WnING8FFr7EknYYKmKJaKDZrp29705xjaI9E/2HIkrmhSWeluX8tASI7JVGQawmyA
 V4BIcHTda/ZQ+aVDrTdMQsxvI/PWCXrqIhqvGCiRjr3zjybX6Eh0eSn49W3BE2FMfoUHoa82TC/
 VBbVPXffhf36fPRM9Chl9EFEilnbIIY8SmPC/ogDRlv/i9YDassuN6aGDgLLchLIdnb4mRgsz8t
 009ChylQcO/SkI88HDEoSzGhH0ZeK0J/2ngpFMEzheiWyBAncO2f1XJmOiA/cUE5kEGEEfF6uAq UYWs/dOg3gQOJmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA0NSBTYWx0ZWRfX2HO3HkJC1VsI
 P5+OXyclFJbbEtllvMha6+o/3dipYjdfuWx4OKPPi23g4H3/+UpRMiY+TGY2s3RXEthtBna2gdv
 0kqmo3IyADyxgD+sUwBzEIo/6Ri6Cq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA0NSBTYWx0ZWRfX6oeK5VvG4Tm/
 S24w1req0Pakzmq2BcYPDgvnBQ7H/lRPlA7HoDl0cRS+Zum+rwXqpIgDleMg84lFXltSH0a2wf6
 h2eUnCLjfDHmNdwe7G5VeXjwJJqvvzoXUhPkr2UGLylc39YCTgb26UedNvuBIvJed7F8q8CmP4t
 PorZNBXZoCMwuHL/1R4Lkk4kztHHmxBMrsFNmAb6oIzVzLrNEXJxyyjKMKFSPxwV2lin3V8O5Qo
 BLSGnugA3piexGWhpMuxx3DuVQ5LJYGyNT089NAbdgQ3c0DeRzJ0Iyr0pcwtSfHN84CQ8jKhZOK
 FHE4yAGT3t/GqSHUxuk5vF6PNNHsLFaBl+ozpw5Cep6lyF3ocVZ3kwjaev7bZUJa1wv8MJiPzNr
 fvvddbb5xIQa9FdKOtnw6FQuluxx/UFuYIXLCHAz6LyXTjp/SGIsxxU1NU28WpbRlR4QwicFul6
 bbtYSlW76KONVxwfSVg==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a3a2013 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sfOm8-O8AAAA:8 a=OuZLqq7tAAAA:8 a=hD80L64hAAAA:8
 a=VwQbUJbxAAAA:8 a=Dav5TBI4JZG5gbSsjs8A:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=TvTJqdcANYtsRzA46cdi:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: yLSDKI6ryYt6P45Im_ZRUW3i4dJOT92I
X-Proofpoint-ORIG-GUID: yLSDKI6ryYt6P45Im_ZRUW3i4dJOT92I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_01,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114086-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,samsung.com,linaro.org,mainlining.org,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:barnabas.czeman@mainlining.org,m:tomasz.figa@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tomaszfiga@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,protonmail.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 865736B44EF

Replace permanently bouncing email addresses (550 5.1.1 Recipient address
rejected) of Adam Skladowski, Sireesh Kodali and Chanho Park.  There are
no new messages from them via other email addresses, so drop them
permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC clocks,
because he looks at other Samsung clock hardware and drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Stephen, can you take this directly?
---
 Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml   | 2 --
 .../devicetree/bindings/clock/samsung,exynosautov9-clock.yaml   | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
index fc0360554f68..9f2b970bfb48 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml
@@ -7,8 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Global Clock & Reset Controller on MSM8937, MSM8940, MSM8953 and SDM439
 
 maintainers:
-  - Adam Skladowski <a_skl39@protonmail.com>
-  - Sireesh Kodali <sireeshkodali@protonmail.com>
   - Barnabas Czeman <barnabas.czeman@mainlining.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
index e9d17d48b4f3..3dcdfa7a8792 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos Auto v9 SoC clock controller
 
 maintainers:
-  - Chanho Park <chanho61.park@samsung.com>
+  - Alim Akhtar <alim.akhtar@samsung.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
-- 
2.53.0


