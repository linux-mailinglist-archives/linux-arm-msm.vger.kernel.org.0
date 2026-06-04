Return-Path: <linux-arm-msm+bounces-111155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pMdmJkozIWqgAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:11:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7A463DE39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 10:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="T7Z/e2PJ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G7veDGwj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111155-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111155-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE2C7304759F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 08:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3239639021D;
	Thu,  4 Jun 2026 08:07:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D046C3876C7
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 08:07:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780560456; cv=none; b=ENfTfkZ3KUgkEzND0yqV9fBIo2YwRTSJHUc6lgbS3hDe8O6vp5ZlRYN8taN+JrIfJjNB6gSoklftyHEWC6br4wd+OZ3eqG/T52CogvKzV37Kxco5b+N+5zmtXiWMOG6UYXLOMsj/iiHVw7SUTJu/e9Xqcld3kFZLNlrTB6fG6Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780560456; c=relaxed/simple;
	bh=wNqocs9HiwlRYOUBv788dwD9FXWwqryHgiMM0wn5LKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wkq3A3SjhknmXFp0cy8jOFyIe8wDR7KS+dMDBK8TDgnX8DmowXcUsEcFcvpiYQy5OAnPMyWYphJnllKPh7pdOr5scctEyR9CT3CV1SpFtJerkG3B7OAMIiEgA0jSiffgQHjNNpLpu34Ko++y94ZEZ56iD/OrDDKfwA8RCXpTni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7Z/e2PJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7veDGwj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543b0lq3233931
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 08:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rXN3B+siA/49uCHBK5RRq8
	e9JZOTCLwpVAP/DtvlG/A=; b=T7Z/e2PJ2KkysHRy7xkvTkA4WZjVQaOLyzy3Sm
	vLjXxvyZCv6H9JIOETeBsIlzVOnvQED4OVLjDh8yBBaBsPtFtZ1bHpMi1E8ohTMm
	yb30JDtR9/bswxyiDeXGxhx3QnoBzk+QJRl/uQ5vT9wxuslcTI0/bHVDWJ8ZXqG2
	L65QU+BxccOelVGgRnh4e/1vLvi+u1PZuj668U0U80DgkNU0z4tLnHwhfGCyDCvS
	xTje5duzXRLUqXr9LVo+8GHo+sTy1ASJnk11Nr8eEAEOz4MPlhXIcLp4v065/E9R
	3TCH82PsdsMWh9D4zA2lRbluAfEmUgvQaed0QH/w1JkuLhQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s2nyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 08:07:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915827fb1a3so7419485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 01:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780560453; x=1781165253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXN3B+siA/49uCHBK5RRq8e9JZOTCLwpVAP/DtvlG/A=;
        b=G7veDGwji/FM9/rontT0oRj7KEmmusLI2gY5SRCJxSGUVTLlWeyF3x0hx7CWvBBYAu
         EyRuDCUCiT/Tn/2TeZTdTCMFknSrmNsPjVS/dfOv5/1/Lk83L3dYEZl5dyyddcUSKzby
         xOB7P5lLFfYFzCIQAkClr14Jv+sj0wtglliwlam4gTOpTZmdcdoWWYMO1EGeqXCa2C8S
         XqhS12EL7Fcn6OyeioGtZhTJv1bvFXcy5hZeKn433p7AWZZxelSNTQkiztbN3hhLcAxb
         BU+4uaNJBhgMbO4WmT3hTzJ44b23ciarPEl7dncmodqlrJmizuXlPU6Afj8h0gYuOXdT
         cWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780560453; x=1781165253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXN3B+siA/49uCHBK5RRq8e9JZOTCLwpVAP/DtvlG/A=;
        b=FXih5H3hpFwrmaoDAvJlLAzM3AHBCIO0GDmUgISYxnkKGrSSqpz82RpzvfLXQyuA2j
         9kXFnTDvoj6b7xjmf0K3GH3z0vAMNAN66xMYQd873QZ+tvHlWxgHtVDPGQjfkD+GHlYt
         853xMllA1lGIuAOqViJi3WKxaqgGIsIwnBRTnR9l09bRZBnOmzNkXxBxCiK/B+izkO4x
         DwXLygSadriZyIpnat03cBnBDVNvZtS8ZEs+WblWtc7gBCTo9mgIuCNEdgyuhECQ9ApZ
         o7MQtUiEN44kowYIE4UqOydxVjObQdK5GvfsjgrvAWVp1t860iZ+3wO/ce3BtfbCqLhq
         Rqjw==
X-Forwarded-Encrypted: i=1; AFNElJ9M9TMJKmm/AjGfafM2U+AYzRZYksoFUZqkQqh1Rq78WU6NsqHROcljKIDRa56k6RbMsJceMnlI6EPPlwb+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DefSDIqFKD1xuQ56+0H9XtXsUFtwl1YLM2T+yDqmdXmbmfFR
	EVOcsEssDI0TcD953REKBoLHUD8AJjFJLsWhoaah1yut5C2Bu7hjeYliP3tLyh9Z3lCv4fVxVVc
	kEug0ukJUfzmItdpTSoqTCURtLL/uikGrCKbOEOd1MArIA6cC7dDXkhULzTXzrbR6GqqYbMQpEm
	23
X-Gm-Gg: Acq92OHrXtSg4D0NmGHORi7iK89GBbkk7+6RUQxam37B5Vq5lmZO2/FcFq7oj+j0x+k
	NttJmhswzkICVEvZoZ8O+jr/VsbJsFCV717klHdmiCOEL9V69HuNGrQ4auJKRt4WYqXxTknaOx4
	9GDj7vHct9zn9fjdbtCsoyDbBcVwqR8a2skd8BmAGqlEyALfYO+qtu+6WKyV+cD7bUziIasHkiP
	ux+6hWdd8DS3i3lRQnGy75PhjoXesfyiZkk3ARVDmHmhZOgORqQ3FHu9yvXto1B6wj2djFUnP1O
	RIPYjSRD+eCMPzqC0dKKuCMTPNHTw8ymAAjVyz5quF511R7ML+21FQYLWdwgXYQAf4JAOllZJIw
	5ed1O7Xioe+9psdPgJCGVZbQsZ0FsFGGpqWOEKbORjsBrU3CJMFWf2WSnF89aDXVxfzE0M3n0lO
	WT+JIBg8fD
X-Received: by 2002:a05:620a:17a7:b0:915:4ca0:1210 with SMTP id af79cd13be357-9159e1cc1b4mr150368785a.3.1780560453279;
        Thu, 04 Jun 2026 01:07:33 -0700 (PDT)
X-Received: by 2002:a05:620a:17a7:b0:915:4ca0:1210 with SMTP id af79cd13be357-9159e1cc1b4mr150365285a.3.1780560452726;
        Thu, 04 Jun 2026 01:07:32 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf052097992sm272304366b.26.2026.06.04.01.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:07:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/4] X2 Elite Lenovo Yoga Slim 7x Gen11 support
Date: Thu, 04 Jun 2026 10:06:53 +0200
Message-Id: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACcyIWoC/4WPXUvDMBSG/8rItack2RLXgbCy6oXi0DndUMZI0
 7SL/VzTFOfYf7frdiEoenPghfd9Hs4eGVVpZdCot0eVarTRRd4GctFDciPyWIEO24wophxz3Ie
 6KLWEXRGLtbFBps1xAVHAQ4kvuaLDALXbslKR/ui4b6tTbtvvStZH2LlRqa1thfWphjJljOiEo
 97Eu31lDdaza3oTErt4WnjSf6iWE+PPh8umdpN8Lj+nxI+86d3VjM4Tb5wJnTpxd2WRHR3fid0
 DjLiQ5CWYQsoSGg4YZMRCrIg7CFg0Loxxtlak7T77DSJCdxc/+tzl9H79XL6MNxZELnLZQNr8u
 TzpaR8PGSPEoaxPOXdhAEYH2jEiT0T1r/4MoRCnu8xWEJcWwhoa1v7BOJUDzANKsPwJWh0OX4I
 j7e/rAQAA
X-Change-ID: 20260603-topic-yoga_submission-fb6dc076e28b
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780560429; l=3568;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=wNqocs9HiwlRYOUBv788dwD9FXWwqryHgiMM0wn5LKo=;
 b=dGIkjowM2M09oxEXfRw0hzDa5SpDlUk/YIp7OwAunY8FNPyANjNtGeGnWZbB1QDEpgTaP6QwC
 zFjt9BpnYMDDgRTpZWhMDEkWqpoG2dpKqEWiYozvGWGbsSYI43jyszM
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: igm1lgco82nelHNtUUgW-J-AoJTL45Uq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3OCBTYWx0ZWRfXwPK43WQVGKpN
 ku1z1Jn7MfAZBR8oR6PDkyPz1zndYzBKO1t4mIDvd24F70DZtpv0Drtu3vT7mglYwMSigmtWiLA
 00jTs/Edg2ovchjjxFTQUJ5v0vE1FDpaqrKAph8xjWovdPUPaZc3moejI5jsewagCZvs3CDLa8z
 oQ4Ho+1XOzXADuXtUC54qpNiPrW3vUpSeEFacnEoEkwYYdBd0aTZEaGgeNWOK9WnfV+Tqv3Gcld
 e11I8Eu4OxINf2jcJoNxRCi/Am/HVjImAqqLdkJTSzYKgOjsFQ5UBp/SAcyeYRIHfeABGOYT7CA
 J0MlPlpxbFZZFZ9PEW8KaqcGBYmx7iRt+4l73DC9JwKPzrFKl6khOyFTYff6ohspTVrA9bWvGJx
 Ynneq/+G9eMvjGY0JGSoycaUTNLcpcqTC94h4UcrLEFM5CYbJe+CFd7x1AVT42h+qciDYG3nxF3
 XLV6i43L4F9aNVjK1xg==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a213245 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=0kKuASbsWRo6JP1RYPsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: igm1lgco82nelHNtUUgW-J-AoJTL45Uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111155-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,chromium.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dianders@chromium.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 8A7A463DE39

This series brings the bits necessary to support the Lenovo Yoga Slim 7x
Gen11 laptop, based on the Qualcomm Snapdragon X2 Elite (Glymur) SoC.

The DT allows for a decent UX. Among the features working are:
 - Audio playback and capture
 - GPU, Display
 - Keyboard, touchpad, touchscreen, lid switch
 - Privacy LED
 - Charging, Type-C
 - Wi-Fi, Bluetooth
 - Modem should work on the SKUs that have it, but it remains untested
   due to lack of access to such a device (it's just a PCIe device)

Most notably, the camera support is missing today and there is no EC
driver (the one used seems to not implement the same interface as the
"Qualcomm Hamoa CRD" driver services), making the OS unaware of e.g.
the keyboard backlight state (although the backlight itself still
works).

These patches are a result of a collaboration between a couple of
Qualcomm engineers taking part in an internal sprint and were created
over 3 days.

There's a number of dependencies (audio, GPU, SoCCP series), but those
all seem to be in a fairly good place, so this submission can be
reviewed in parallel. As a result of that, this v1 submission is
almost expected to trigger some dt-bindings warnings..

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
      dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
      arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim 7x Gen11
      firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x Gen11

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 .../bindings/display/panel/samsung,atna33xc20.yaml |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    | 1237 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 5 files changed, 1242 insertions(+)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260603-topic-yoga_submission-fb6dc076e28b
prerequisite-message-id: CAJZ5v0iRE2Fd1uWSWAcDPrXCsDT8Xvt9knTczN1DfANK=R2TkA@mail.gmail.com
prerequisite-patch-id: e5bba0850a9f380c1d369dd56076a7ffbf7e57a5
prerequisite-message-id: 20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218
prerequisite-patch-id: 9ab2b37c0a11c3a9590be921fefc8709ebebf6a3
prerequisite-patch-id: 21440dddcc340d35558010fe88bad9265e43c6ac
prerequisite-patch-id: 162f8b373ead5344ae0f29c92432db57a0d75f39
prerequisite-patch-id: bf5532cd5c8b66127e20be0677adbbbb3bd9578f
prerequisite-patch-id: fa7954f6fd2d27a6f0e805c9643b70e7e201c503
prerequisite-message-id: ad9ygQD6962M_UpV@hu-anancv-lv.qualcomm.com
prerequisite-patch-id: 48c26c428cbeaa674a615704d1abeb87e4e965c8
prerequisite-message-id: 20260523085511.2532669-4-sibi.sankar@oss.qualcomm.com
prerequisite-patch-id: 43e96d8a5063f51e2b5ee75fc8c9e10682e5670c
prerequisite-patch-id: 2e71d345f84a821d89da2a6064954409fdb1277d
prerequisite-patch-id: 0b9f5995044bb3d3ffda227ac986b755fa118c63
prerequisite-message-id: 20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com
prerequisite-patch-id: 9175e9ae77ac032c2f0502e2c63bb7b7d1ae4ead
prerequisite-patch-id: 916e96859119985c09aa265f45f69e0800d56988
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73
prerequisite-patch-id: af18aef027c45213c11b436746fa31b3b6ebe46b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


