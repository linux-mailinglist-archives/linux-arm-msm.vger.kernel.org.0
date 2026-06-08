Return-Path: <linux-arm-msm+bounces-111705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M7ucAdhoJmpLWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:01:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 994BF65352B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:01:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hXPSHrH+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I7QrK/Fz";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111705-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111705-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 826753028F73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1F1395DBF;
	Mon,  8 Jun 2026 06:59:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91763955EF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:59:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901978; cv=none; b=KHtK9Rx+SQIMQ4xfxcBF1nBABroQXsjuIZ4fS3ILeH56tHZKe17WPx2NKr3cTVufv2iHSp59Y8edoVIjOLHhJ4wuB1KDtEjaJ6ubTRsG9yTmqASMjhNukD4U1tfRytg/cjfFkz/Is4S3Ty+jQK1/XJ8xiM387Ncxjm87DpEH6wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901978; c=relaxed/simple;
	bh=N4lXB4opQ7qAKuk8u1f2aSIoAAZnDbqfns47nokZNK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVIss/afzOrV56Jkr23xusgR2q3i0fhjsY8cgyLOOH44zqbvjgIUm58UWTKh8oEDD+WgC50Cw5x8dw5zXm5YYD7loln6pJRX/M5yXrKFJwpb9mCd6pggKrC/gPrTRbShFQhPR45HwXqxFk4e0VaDSB1V7kz2ozMikwcg5IQzQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXPSHrH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7QrK/Fz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PT6e2808213
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AedYKycSBAq/raV/KihAPiAmgc3F5eLdRbQLIE6J3R4=; b=hXPSHrH+fhqGRdUP
	q9eHLRWIYHtW6GtbyWMT9hijFc/5KdWgWVN0gomJyJnd8hpMMi59Wha1fmZVst+l
	ETaihHFgl5zaZnM060ze255aWH0hIWC3hLm/vDayGKn1vwuIHuQOswHe+HixmC58
	A/KDzOJRT53cHnrI9j5DGRbY++HcOD9SU4wgrmS57INynG6nyRxZmlrxfl0q1vCr
	zkyh7FhV8cvqsk1ZiZrOFXqToVtL0do9+9cIxKTxOxVhI1hBOnJV+GFVjB1Gjuql
	gIc/gMnk/PEDO9G1z9PoHLF/8UINs1S2dpYV9SjayXbqTktOiPxc601wKbI0PHo1
	T1B+7A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6e69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:59:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7002d6c3426so3375174137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901975; x=1781506775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AedYKycSBAq/raV/KihAPiAmgc3F5eLdRbQLIE6J3R4=;
        b=I7QrK/FzW56s0UWnx7eI+0pCmrJ9u92svD9TW/NNUMxMf5Py3998RahGYHPpCMx/uj
         u1PwHSmh3YFAS7lqaFmt0qVG8ii/csDbo0sQQXO8r0qFx0YnJbrWhEd+giOYuqYwo+Jx
         AVadIP5v0Eb/Gz3UbRGxft/8qJWa/psBPd0kvIEGY41E+93KbdG4VSbruaPX1bwJyNjZ
         +0wkCOEoJivzdLk8dr+u5Q+Hzb30yZ1ROlW7KG2WNW4liFlV2I5x33DuzIqGVp5S98Vg
         3KBgTD4mTrTtWrZme1myjlWJ18FAjA5rrsCdkEqYn64SPagwBSIebWdUW9kZgrC0irkU
         3L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901975; x=1781506775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AedYKycSBAq/raV/KihAPiAmgc3F5eLdRbQLIE6J3R4=;
        b=g8OCN5PzKiuXrde8uscd9QTU+KBchUpcITB6dimQ0AUPB6tScQArw3hwJiNlXnvB2I
         kG/KNLZdXaF8wlWveyW6zLhekzjtPAsMC6j/YNkERE6UTSeyu2S9KLHPwikSdelWNQ2j
         PIcbptdPyHO3qsFEG1pSQfOdNzpPFuSVRmmnO7MiX6Ale45cQFZncx8tz27uP3Bak5jF
         brPodXMFLzIzw2ER5itU0oJZZw7oWcSAOgFQhBx53YOEpxMCKb3II0NZpXcSsI+Nopdv
         9Agn8j5VWR4id+IbVoPqgekDm9LhIbn8MGdEjSRVWlAGRL4S2ZMgq1Z1N6/pf6qU+/i9
         K/Nw==
X-Gm-Message-State: AOJu0Yy8a7IWfXR6Ut4rEw0ZWOW0MMlHoRXnlUPLg8awLDhChqCPjz06
	Q8pUn6DkuCtDNq4K6+byLfPyo6rTErj2p0AC4u4PLEqXAqmzEmWJ0zfZwa5f+4AYsYCIy2cdcUk
	kBNOb5RV2c3HH9TfXQqvbNMiSmJ508WG0tgr1wIxJgEEBGM96BR1f/fyvkNCAuhwoiTKy
X-Gm-Gg: Acq92OE2LcpZaPT/ayDfsAPSCinR74/JLgxh7fs04ACZSP3RZ7NlcrnEGlnYgUOE1U5
	+NTtiww5oIR+Zkj2vrp13RkSq5ZXKDH7ZycLKkr/FZnMRXBR4OS76Nz9rHkqiAeB5c5TQicFZUS
	4hUmIUcEFf8ZSsUIW+AWPBK/79Ozm8J3pcjdPKzLTMITrASv8vcuCo9WZn7aH/fR4wxRbi1cQTY
	M7Y8IsGjQ4Di3l8LCNVAZRSG715RqjAsccDmf3ipc2NzGKDDrSsBG59spZlu5TiMpTl5YnpaAWR
	qNr/VeV3oTM+rSlimndFTuZEt+B8hp9Uw+6BidmSSnr4m+nGtzPvlhphRak15wGvZXJd99umwK1
	M/6I3koVpvKrm30FnFtUITYOgee+EnEXKut6MF/XQVRAahosq21RKNfA8gcXgRQh7qk59h+NQVb
	m2tD3m+hcm1ztZdytdhInuYgsY39p3gMy9HbWZRCRrwhcx4Q==
X-Received: by 2002:a05:6102:80a0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6fefc010482mr7047251137.5.1780901975191;
        Sun, 07 Jun 2026 23:59:35 -0700 (PDT)
X-Received: by 2002:a05:6102:80a0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6fefc010482mr7047241137.5.1780901974810;
        Sun, 07 Jun 2026 23:59:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:22 +0300
Subject: [PATCH v2 4/7] dt-bindings: bluetooth: qcom,wcn6855-bt: document
 WCN6851
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-4-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N4lXB4opQ7qAKuk8u1f2aSIoAAZnDbqfns47nokZNK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhLefQFtHVh2ZE5dkKFHBcXKIIkVHYL9/M6m
 O8ttgGrP9+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSwAKCRCLPIo+Aiko
 1U4QB/9K3hMSohuH95r/Oa9z5CleEUZa9trHYMzkZSs4atX3e3oJ+ChcjsV2CqnONdGXXsumJoi
 r0dU0wohcdC9sUpfzUgOjDFrCiebbeD5sDDwz37woVSxK3w+FHzup43hPyuYbtHt5bGWSmvAV5A
 yO0N73dtOYKgobqSW2Jp6OzyCgM30hqO/5lcAhgNfQFkkzzMDa18gytiVJjFgy6/MhVDLFP1Tvi
 ZzcuGwZcXa/rf7tt/cwD/9BKHe94vCVjZXGvT2F4qSHAgtYl9n3SmCHUcsV6O9MHyvF0Yzto/+L
 wIzPN12ka8f5jj5HbdGkiHXX+SiSNQC+C+JTg8GyMJ3YsVhl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aSN2uZF_CZMDTIQhIA-GWyjD-H_X7VDy
X-Proofpoint-GUID: aSN2uZF_CZMDTIQhIA-GWyjD-H_X7VDy
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a266857 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dvh2RpXz9-UaKh2pYLIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX/uwcNYajcYxr
 4RiI27vA6UorTdgf4iOwxW0vSOu9xto/3NZ2Q6zea+xaUU+PvJZfTdkaRsv70UxHsExzhcM7ECD
 f9qwaWCAGTDoX5IeqWA0pNQWhKPh5FVxzafM8LPw8AlPryh62r04L87tlc7hAqTo6td2QM8E1Io
 UJ/ZhAh0oWdVYFuIgDfnMgmLhCCcGzCEwoPsh0cjHdDvk58jbujXC2Na6O7PYG0DriYl9NmfSDx
 O4NGsqz50wzLN3i8M1RLdCz7kg9sHTIapAh/rA2I1VTnKl98+R9rK9nB15rLj3c8OTIXwGrJ7Td
 6FW/MC+NQa0OBb2SM3v7qF/NwLEE+TdSu/VD4UaU03Cv3W9FaFM1+GM/tDeifwAjvS+3MLSXsie
 OD0Gd+itsltxFPseZTQeW8Yjs0tgbZZEP8tMKwAc78T/uO4b6pQNk8PXDQ+6xTZxdRf5nTKyWno
 IrZS6GtCpfZUjFJ+UEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111705-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:konrad.dybcio@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:jjohnson@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:devicetree@vger.kernel.org,m:brgl@bgdev.pl,m:linux-bluetooth@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 994BF65352B

WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
it. Add a device-specific compat string with the fallback to WCN6855
one.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index 0beda26ae8bb..ec766f40a042 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -13,8 +13,12 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,wcn6855-bt
+    oneOf:
+      - items:
+          - const: qcom,wcn6851-bt
+          - const: qcom,wcn6855-bt
+      - enum:
+          - qcom,wcn6855-bt
 
   enable-gpios:
     maxItems: 1

-- 
2.47.3


