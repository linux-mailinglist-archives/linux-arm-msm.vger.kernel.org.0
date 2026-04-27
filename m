Return-Path: <linux-arm-msm+bounces-104722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOUTCoZb72llAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:50:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43C472C87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E318304A21A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729853BFE21;
	Mon, 27 Apr 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbDvfWxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqlwG8O7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B263BE650
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294013; cv=none; b=AoRNrfu+vH5VMH606dZB9Yj2vzvuDy2NslvEgA9+pUC/h7aOCFXS9yIuBwAg+MExNXSKVCsP/C8J8kehMzjIVCtaR5Jq+l1eykCcfJ7I+ptxo3dXy3jnJFdzvTSWzNlDjv/C3Z4x91NMJAKzojTlOaOm1XAb414VCvq6zaOx4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294013; c=relaxed/simple;
	bh=lPbPNpJ2ajYXcbSU6CUgF1cdOaknw2iS5g76PqOTMJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/yu4evCjbdb+xOPSeZfYPa446T+hehLn/X0y9y898pKNQtlQ7ezNfjQin8ftAs+QEvYfjZPBH7yNjibQE80A3TzCP5PCekvarnt7RFLpBaf/NQzHtZw4A9vqRZ0nTTc3kVue2/cKYnhfDYRKgfMQEK46JqFBljquqOCe1Qmg30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbDvfWxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqlwG8O7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Orpe3825535
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=; b=kbDvfWxbKpo8tYce
	l1OaVfKx2eJfaNCcN3nbhN2Lz1E/0sxlqzqE/RjKegt0WTh9cMYUFgojSREZ4iho
	2G7DoUdE2u87qIdqOfGsDgpSnjO/UeVqeaYIuYoPyPjmcNh269gdn+l1EVtu3ZgH
	+3qRqwo8MA8ftaSrORJj6BJ05Gmb+NUUib8F0+6TEmz3dlVjcszu1YOtB8EGELvs
	Dn9x5RQK9EM3RuD8CMbvwpS4ah+fXLPlfnifaFrHDDDHIDer/qS39P+6RjTWwLA9
	xMFRRJfGWaH9MZsyAroL7IndcN6/4lbKkLRlYs2SO3fbHmVd7LmyHKZPZcA5u1Jh
	BYXN4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550r2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:46:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf0245b0so35499821cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294010; x=1777898810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=;
        b=iqlwG8O75Zg7jCNRHXfk5Vqk7CUxc3cbbc7NSwUjEZ4ftprGERSPIwg82wPaYLTnlJ
         7UKNtS/ToV8pRjmmHd8d8ZklUizB5k5o/+kKc7BBnTC2sNu10y2nlcZSkSdhmQzVwYXF
         VEy020Y0HWNpUpFhaGxBchZcuHkZSppoKPNmCpYnV2fDnzsaxnEWNCAqeoVJYCFC3Pvm
         LEVh4U2TQ0LmyQkw6k1PwmsVD9WNZZKOoqoqjp4JiYjh+SMR6BOdz7YKELwExpKn9OgJ
         IQN/ymehbm/oEzd5nCv8Fow5Zo26lEnApjQKl4tD3crygFuaBMypmg/7mQF05uuNlR4P
         atFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294010; x=1777898810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rZxWV2BVzHNmwNyI4KXBWCRAzv77VAsdiAZYzEAZKc=;
        b=jqmJ6TxWyPOTiBZIsiuJy3ahprL7iM1476VIUNuEVBH+uNGeQq0soBTM3BvFfZmuyG
         6IMhrkIkjvHlK276Bio//PnUDuSRV48RTD8970mKfmmboATIRTbNGws+iM3IC+nJ4PXm
         VRN3cUkt8JZ4uqSKwb4hJYKKim2p1oKTw5u3Y3H9RFWN+uSxU45edupwUpZHt7+Aaalo
         wPagNrwf49VHitXKRc71bd9tSYtLALbVy5coTAbvFXGy1i0LEzeL3ipGzD7aZiC/8Zro
         aaV44S/s1MWwczACigtCmFXDHTG7I+6MakN7TkeU36gVYB/caTgO7lQgFhLwfNc+x8aE
         hjoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XFqbRbtNvkkrYVc/oKZ/xgTrY94iQmlzm1Tj51dtQmV+lL49gW23Ln5x9YzQCLcUeqOc69h1cHOOSqs2i@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGTs0i2WPB7zNaaKJFVe88UtiRpW8E2szOjwgh1I8B6CRyfQN
	N8l5GBqA4jgPAJmfNlCDkePHG7qPHBkuqDF3WZno9HohShDUohR3amceFqve+S4NtSA2FFqRJTT
	dEjIiWv6MvEicEjFuy4DZK/+PTIOWYH3Gw08yQDK8grS42Anj/kodR2eWb8el2nLuvkBt
X-Gm-Gg: AeBDietVKXe35yXynrdMotTcNYeA3T5r+9cFd992KB4VSds2/NJvyZykOQkNvg8mLP4
	P2LQ4OYs/+uD5pSZA+Ctwxg0JORcNxMvxrFdF1THpXLc7ygnwMCIIXgNxn9HmwQVfiuoJCExWU1
	IDBc4R1PTFsBXV6qC+7aYtsMSlGO+K1c1XgrekT6r+Y+lPgBXYDvjD/zFY3QP8InUvnuIn+jHt4
	doY8xJIxPbBuMeHy1dh5JbERrNs8Z0YZgc8Y3AW88t8zSTFrYR3KaHBNl635RCb5S6zJYJjLhlu
	Bw99vlUi9Ne4HWfHR1wLOmLPNLMZO02eQ5W3Bqp3J8Ch16yvCv42gLrBg7J9t0odqJpXLUJByfk
	Ha6MlREz6mpdDewdhsKEHdmf6Ae0TkFPzmIrjbU3Xp+mM45szi2Uf46dWOAcB5PlP9HIPBflmDD
	7vQjYqVKts8E80+WCMCmo3XuBQ/MA=
X-Received: by 2002:a05:622a:65c2:b0:50e:5acc:e792 with SMTP id d75a77b69052e-50e5accf287mr351235241cf.14.1777294009725;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
X-Received: by 2002:a05:622a:65c2:b0:50e:5acc:e792 with SMTP id d75a77b69052e-50e5accf287mr351234781cf.14.1777294009301;
        Mon, 27 Apr 2026 05:46:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:35 +0200
Subject: [PATCH v2 08/14] media: qcom-camss: Add image formats for Qualcomm
 CAMSS parameters buffer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-8-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: E2dD4KDQ0dK5PrO_v1zmavRbkC8sQhex
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef5aba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QedBaXGEmMrZQ1XkLmwA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX9Y+hsaqG+2S0
 aqJu/N3FyiaT9y9S5TV41Au2CFTPtgFJictvsGBLAJxYnDyMTHTfmpfFwhh2QmW4d0tcs9kflyX
 5nyflmnbpPzUL6hFyp91nTMZKkIrR/0ghF9/RY6Xx7Sy24v4j0l/DvwU2SDFTmi6Lkb6Y0XDe/2
 w0hGqdMPCcFdIEt30TFIg/JXnmBT4KA5Y6dBhFyM7GTnEXSdti6f9P7COd3pIyZ+mSpWGE7E/KU
 j42h0D0NkXJXVTIB+jE2oMvtlTYzOQhZsljavtLY145KCLzvWqKHYAZHu4gcOal4NPUR+Mn++YZ
 nfhJGIf1UP6Au8+E1/DtBIUOsr7jmpjr1LZu3ZTSr7gHKP5quEcHZZRSpNBVfda+LIbAhkjTalc
 oVlNhHu4H9C7S47MSdAyem/W+rFoANHDBRrXp+enol4y+4jZ8I+8ABnlclsjBf1lLaaOMr7VUMw
 u4jL97HMKKcxBI4JYlg==
X-Proofpoint-ORIG-GUID: E2dD4KDQ0dK5PrO_v1zmavRbkC8sQhex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 8E43C472C87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104722-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a V4L2 meta format code for the Qualcomm CAMSS ISP parameters.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d59409dd6cc97522943 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..f861211ebd7aefbcf4096885388069efed27ddc3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -888,6 +888,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1


