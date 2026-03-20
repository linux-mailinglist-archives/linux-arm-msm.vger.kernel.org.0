Return-Path: <linux-arm-msm+bounces-98922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOCtFi8xvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:36:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF962D9AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 692C2301F582
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C744361DB9;
	Fri, 20 Mar 2026 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OejlkLEO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hieLHwhR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E737D3921DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006512; cv=none; b=mfk7HDtkR2vhko6JBJa0HzKTOGU2Hl7tPXO18BpT1K3vhQd4fr+FgXgL8e4qcMNSep+zTQFtrcnHLJS6kAbZcJdL3NseN8WNk39Ub8jx6OOXzkM3/+SD0v3pcvxz5yp8u70c5utj/moDgnkzCsa8xAoXLUh+6L8tIkoUH5Lek0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006512; c=relaxed/simple;
	bh=BYH8hix/PsgS5oaEWYzymqik9ata0LWNfM+riCtsDJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lSFjil6mlSt3rLrd2JRYFtqiZEzEGsaMQO6k5MlRs4RY3WVe7U3Qxax3jLheRd1Znri/JwASeLcguY0vkBgeb2TuMnn6BowulBUoJ/gZjCXyZJvNLgnecBZ1RoZ/1Pt5SM7mmj1pY5aVUVaDPNJ66OnzV/wbMtwRF2LhiZD3FpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OejlkLEO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hieLHwhR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2ZHu4335200
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MqNikmF23O6v9Ecpgxhnmj
	jzFcBwmZzu87q/sy1ZNsw=; b=OejlkLEOJ1w049xX8BbcrfzfYCJbyEy65heZWy
	Rc0tAsOxeUreHyNdXvqQfhwccwD/vXjZNnLZdG1Fs5Q6Ze6YddlWxTNgIYCPZhZ1
	uuckyzBlZUGxx6N39dNM82nX5F2ggvj0LF8zl+uiMIP6iIItmdf7uctSE/2tXk1A
	PrPDz4YCV/FYQMG5J5tHuh+JrPudbZMoSdRj0VLxd6PI8OxMWn2Kg0+BfLOdX5m/
	iljHRJ8Mhx8JHJab+xOvY43sMWeVz0oVdMF94YwYXaZQpbmmls6b6ZRqfTiCTVcz
	Cvm8E11/NeXngFwMkxhTPh4J4iCXwqVotKDxSg2k3aKHJf6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k08376k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:35:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091f12ed3bso17793891cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774006508; x=1774611308; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MqNikmF23O6v9EcpgxhnmjjzFcBwmZzu87q/sy1ZNsw=;
        b=hieLHwhRHzeCEr9oUXsOM3q/W7K+ZzUvAXinNlY7WMPr7QwQT8ewNryEuePgffB7jE
         qQjLlmgh4ntE+LhsZ8wr6w8WhIyXiPqZlVBVEfBA5svudo06RVLiXjxD4ZdMRW0m7ufq
         qe6sYgk7Is+EG4HshUmBNCfyWSil5psCx4u1DhhIMsNaJazzTaqRZ+xBebayi7FMuX61
         A4ixkwHokNWZsuplMn5F0Y/4Jp3+aYq2FQ1/Gh6C77HxkDEcSkqyk3GSP4wCCqDhIJOd
         jpeBbhRvQq+5xaROQ+xGN4mLmqbp5W5iMD0FPPuRkFvh7KPmUoNX3ukarnHaaf+smKHV
         psRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006508; x=1774611308;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqNikmF23O6v9EcpgxhnmjjzFcBwmZzu87q/sy1ZNsw=;
        b=Ugpcf7I4cbv7wuLQFG6gst+es/rKe9PpMaBTmhzhp+jbWVaQ2a0FD14bPyoGL6u3XT
         XGcy/gJzF6DMW8f+7IENzyVRMwRsGDFWZ5AL8eMWeMrZs5VtgYR4kSWHOdSA2Tnf8FNI
         BmAvaJrhEpYK/XK3E+J0hAQqlO4mlMSHn6Zj0YOjRAOk2KhavqwDNEV+MWrQp0HiyupT
         iQQ0hRBMq7xVwi71sVYd/ER+slloGt/1bn7jwLJXZQ9ScJPv6MSgvyoav2aLg5egicS7
         b8tYKp+bOzwLw8nB87ryfoI+E6qfkIpYn08ZM6A9Yt7Et3UmahQwmaNKNUUp6PN00SJB
         yeXA==
X-Gm-Message-State: AOJu0YzasGII9CJcUMaBZ2bYKKM5X9nzMFaMT/NeOdNdTDnbszdJBviD
	coyN/Qohgt0fOxwOUTLEILYJX8cXs39qlYzkqQqaFh6tooFLP3EJPX1WfPAnvrDXpe5/G/GM5ZK
	IOpI43rK4ABpGHoRnHM+djhIXpImyjTm2ykAKxOS6OoMnGzGBt2Ee0hchYp+REUzX4u7H
X-Gm-Gg: ATEYQzyeaTPaHZdBVuxvCXbvWN8MclMuG4whPNwWRgH/W5859VK/F7r91JPZ8K/UjL+
	/pXs9skoJQyRHE6B5f+pds7Vx7V0F/krwjYX3QVBjCmF5SrIirA+9LHQ7/bUelPAjwU/vKDp+VM
	IPw9phoIpk7uVrFqI5a9Dt/Zg2bM96ejyMalTZZrAsdElerB23vDnZna2JZ8c4AhAUX9vLHX8Ry
	8v/dBJo5PhYPqo0sFo4tawA6sE2SSh5ghMoM+EO6W7nAKW3S+tsAx19I6d25iplIPXvtg8eZojY
	M6i0x9jhdrrfmmGX5DCnsTTXKvO2L/KcLmFaRj7yJd4kbl93p0ze4KtS5dLwkAABK9ahzQkeokc
	5dyuIDgdkxXQ4obrkRY8llAY+Agw=
X-Received: by 2002:a05:622a:5c7:b0:509:2d50:9796 with SMTP id d75a77b69052e-50b37449039mr36972681cf.20.1774006507828;
        Fri, 20 Mar 2026 04:35:07 -0700 (PDT)
X-Received: by 2002:a05:622a:5c7:b0:509:2d50:9796 with SMTP id d75a77b69052e-50b37449039mr36971961cf.20.1774006506998;
        Fri, 20 Mar 2026 04:35:06 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7d6c54sm138162485e9.4.2026.03.20.04.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:35:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 13:35:03 +0200
Subject: [PATCH v6] arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad
 and touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-glymur-dts-crd-enable-kbd-tp-ts-v6-1-626d008534d9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOYwvWkC/5XQS27DIBAG4KtYrDsRBgzBq96j6oLHJHGb2A5gK
 1GUuxecVsqiUdONxSD8zT9zIRFDh5G01YUEnLvYDX0u5EtF3M70W4TO55owyiTlVMN2fz5MAXy
 K4IIH7I3dI3xaD2mEcrmmjjqr1lpQkpUx4KY7LR3e3m91nOwHulTY7xcBj1NunW7PiDURwQ2HQ
 5faqsdTglv7WpP7XG21XNc5VYlzzH/8xDPewxQtxGkch5BA1spKrz3lzLWzepYpExYK/QiUb2g
 +o1YNLUQZZtfFNITzsr25XrI/vai5hhoaidlVUhslX4cYV8fJ7Mvkq/xZWszsjq3Z3yzLLGNKW
 UThGikesPye5X+zPLNSusb7DeYd+AesuGefWILIbBalMjUXWj9aQvNPtsmsMELQRgsu1vYX9nq
 9fgHtSyMj/gIAAA==
X-Change-ID: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=6116;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=BYH8hix/PsgS5oaEWYzymqik9ata0LWNfM+riCtsDJM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvTDnahA+0v2W6dQsDeIZFQpPxvAoD/xEF7FVW
 S9sb0M/iVSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCab0w5wAKCRAbX0TJAJUV
 VoVHD/9x0CEvVp7Dm6UwvvoLlgooqLPSAL5xgLEMnR2/GtnKFmPbhQ9HnLdfI7Cb+ukKg6XT7eb
 6TbkQe+/nE2ZBQoZlrRAETRULXB4wM/bxooHRpNfDDBdPKst+TL8/NhwuWXZ8TuJ/lBT7foTL1h
 UbCL9DR8iGUvotrXayJAEcxKsf2DBIXbPxulAGcWiLPwIroHVjvAhyZLMvAtoXhlLHpewU1MdqT
 GJkBE9zxN/qd5rFUQobeMuldH1g0Pz91l4otj1Z5xRAqYAiDGWkAUOQx1XBxc7k6PFBj8lRqnQZ
 d4zKQ5P6ADHexbtSNeQ9tKRHLYwTMZaRJpnlmw/6qLQNg4OAJJuZKuxzuiasj2A6U+WuUwBQf4Z
 fGap0opKkBEIU7C74EZAbXYJrvdfZIoOU40Xxw5M8//8rea31G6ikyk2+UM8D3jjIF3y8XDUUg0
 Rv6SKEUqj5AVCN2vlEiYt6dQ4j3RuJF2iyQnQvVap8hSIj4WyRepCKs0wDgDbXLuNc8xIDvJ1Jy
 jNaBIPkJihlnI/eYWHJ/dO5IPOwLShHCIW+5/IH674Ca/e8ne4JM9wBEohmteIQEhjas+w1HnNG
 3BLbPm23BgZ1TvCgP+UtiBKCEmO4/vBrFD6n7mQeB4vN+I0g/9WZkvwJYD1HXyUTTYlosFQPFp6
 eQkCn67k6Ym7zaA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bd30ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Z8kwFSI80t0WQLcuoGMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: lsMBm62QA4Ru2xGMPXkGGeZYXhbPSNzf
X-Proofpoint-GUID: lsMBm62QA4Ru2xGMPXkGGeZYXhbPSNzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA5MCBTYWx0ZWRfX4n7S+THn7Mwt
 yBBM2DwAbYcONeIyl8blb4Wz+PV3/ORSEP/RkgMCQ/qi6qe7kzWCso4uevsv1ye5zixBJMA0fqn
 8QGGF5g48cxhzP4nFKO6dleGG3F5jFPlNW22mdYLXFnW7t5vSuEoPKRs48RxYZb/kodHGsIfWY3
 8HsHrmCIxToFqzBRyuLgWPEYj49H/F//kTAwx/i55bqI7TE5dd6+MswhVYjHA9s/dPbeqpt2rY/
 hFrNkKVyLebl3QXobQpzTxwOQ+9LvGdaWl/uCfgFGNREykKWtUmvXZHgBYDo5NU8ColE/fieglj
 NOr6syBDAHyFK2zVjz2AmGWefI5zhRMGWN6dSkEh6lnKtqtqT/kYsJC6XCgtAduDTKDDeLQucws
 +T0ymYcfikbLAhuPwvESAs+47pk5KZARxjhzFBkQXGf0BtAiZVKec6OZx40uYo9NlVAjqaPqKwq
 g4FMUmRNGneYnlHiSHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-98922-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DF962D9AEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On CRD, the keyboard, trackpad and touchscreen are connected over I2C
and all share a 3.3V regulator.

So describe the regulator and each input device along with their
pinctrl states.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v6:
- Rebased on next-20260319.
- Dropped the always-on property from the vreg.
- Dropped extra whitespace from before vreg compatible property.
- As with the dependencies patchsets, instead of adding the support
  to the common glymur-crd.dtsi, I kept them in the dts as this has
  only been tested on Glymur CRD. If Mahua CRD upstreaming effort
  deems it necessary, it can be moved to the dtsi later on.
- Link to v5: https://patch.msgid.link/20260319-glymur-dts-crd-enable-kbd-tp-ts-v5-1-4a440594348b@oss.qualcomm.com

Changes in v5:
- Since this depends on Displat DT patchset and since that one
  had to be respun in order to drop the non-merging phy patch
  dependency, this one had to be respun as well so that the dependency
  tree is correct.
- Link to v4: https://patch.msgid.link/20260319-glymur-dts-crd-enable-kbd-tp-ts-v4-1-dfe67a134996@oss.qualcomm.com

Changes in v4:
- Rebased on next-20260318.
- Dropped all dependencies except the USB DT and Display DT patchesets,
  which are needed for this one to apply cleanly.
- Link to v3: https://patch.msgid.link/20260313-glymur-dts-crd-enable-kbd-tp-ts-v3-1-66c5ddfee97d@oss.qualcomm.com

Changes in v3:
- Picked up Dmitry's and Konrad's R-b tags.
- Drop the output-high and add bias-disable to the reset pin of the
  touchscreen default state.
- Link to v2: https://patch.msgid.link/20260312-glymur-dts-crd-enable-kbd-tp-ts-v2-1-2277bee4c564@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260311
- Re-ordered pinctrl properties in vreg_misc_3p3, as Konrad suggested.
- Dropped next level dependency patchset.
- Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-kbd-tp-ts-v1-1-56e03f769a76@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 116 ++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 09a532822787..51ea23a49b9e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -8,6 +8,8 @@
 #include "glymur.dtsi"
 #include "glymur-crd.dtsi"
 
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
@@ -90,6 +92,80 @@ vreg_edp_3p3: regulator-edp-3p3 {
 
 		regulator-boot-on;
 	};
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0110_f_e0_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l15b_e0_1p8>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c5 {
@@ -163,6 +239,19 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
+&pmh0110_f_e0_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		power-source = <1>; /* 1.8 V */
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
 &smb2370_j_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0_1p8>;
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
@@ -187,6 +276,33 @@ edp_reg_en: edp-reg-en-state {
 		drive-strength = <16>;
 		bias-disable;
 	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
 };
 
 &usb_0 {

---
base-commit: f6eb9ae8b9fc13c3971e4a6d1e8442f253001f36
change-id: 20260309-glymur-dts-crd-enable-kbd-tp-ts-c80c0cb78940
prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v7
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d240ee207afc875f46f640c6e72042cf5bfb61b
prerequisite-change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750:v7
prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
prerequisite-patch-id: 8d240ee207afc875f46f640c6e72042cf5bfb61b
prerequisite-patch-id: 346f2db0933c551a039f63b945f989a5c8320657
prerequisite-patch-id: 8bf1870491095593aec382514f041364ffecced4

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


