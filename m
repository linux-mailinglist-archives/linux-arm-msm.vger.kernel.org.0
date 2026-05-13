Return-Path: <linux-arm-msm+bounces-107291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODUENJZ1BGqdJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:59:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 524E853376D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3617731262F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD694611C4;
	Wed, 13 May 2026 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZz2zBO3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4IVfiD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B948A44D022
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676559; cv=none; b=r8/5cBuAmGvyCeDE9p9x2Zh4PQ1tkDV6UTR3tgwHTtPsmz9QHnOd0SjC6HU1Ag7/5PdVY54Wv6OtFDTj+BCKD05wq+dCpwFgKz17JtwYytRVr4sNvJUK92nalq5ru1DZX2BJ6JdbdCFOWyab6n/XvgKRbBk9cLQYBBXcOZOq5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676559; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtBQkod6Qwz5jraLdqzUdUkCi0a/vyGzTdQLuweDOsXO2cfTaWEEKuaWiI0xRQJW2JIkL+nhqNs+gcKXCnvs53zz4cgkYws0Agu250uQEcbOvCx1NsKKx1cG2F7P+F8XBCTD8wck8Dum04IuuGkQErWE4JKokiTLP667vTcrmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZz2zBO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4IVfiD8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVKpa2321247
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=LZz2zBO3WvwG5GSu
	UZboHoj/9K5fYP+MJlpPj3zQ47Z/FXuuf391DqarRxVkV/nDKIR6BQlVPa5XWTJ3
	XBtLQyChaTifViHfmG7TXivLeGgbB2/tp/n5FiRjpY3xBI22tFnTILzfVGOiOip8
	q8mEnmgbhun5L6MWsz4OUFC0RB3FE8gK4/nGysUw0vIJzNpkypHLlHecZLEbcN+e
	Szd+6pSI6JqS4dFhaZlAXw6Y9oqV8M54M9ak2HK4V2LOCE8RN/D42sRg5RjhQ32K
	hSuOvTYxT4oJ7MELgghMopLo9+oRNED21NmzUq7A7tmEGCfSWlOnEaokRE8OVnxd
	DI1/MQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgu9y1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:49:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514a182b90dso51499891cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676556; x=1779281356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=L4IVfiD8dBSA66AihQaD8Maa1MdnPc25cJPgQlk5h/JwjLuvJCGVtUykQM4xoZRFpH
         HeITguPENo3GE9Xe3tH34Eahqey6bsV49ccX3VxIocpQ1st2ToVX1893Sy8Jjp7Lb6C3
         V4O2maVELwz7ueN5kDaLJXeiJV7MNz+jdbsvSENb+d2PEGgV/WHMmRBOfik7425rrkc+
         jKBRVn1Pa5HaGlkHhShy2xvseXggw5AhgXT/4MCJK98aomae966o09LaH61ApPCy8xnW
         gJLFQ+q10oaCGt6zptDhVvV1x2xlq1RIYAESO+dP0CaHgUaGzS9YgdjB/8h9Cy3SnLlA
         QjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676556; x=1779281356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=sLIx+vQ0B+KIXAiVI7Oa9//CPFgfAiMtLsbbJEoHqetqux+PWzrFBLoFpQAMkNOojW
         8ZMhmEgw4r2ke/DL6AFj1/Nn+FZTz4HlU7UDZ4E1vG+2qsFDvX/WUtPuQJrB7M8Fq2j/
         6dG16rMufnVPxIOpdXuZbdWLkLjbCoPiPr/M/hrUV46mWG1vRdcKaj1jRd8gTQ9q44Wh
         tCH6eusPNW/IbSjRksvj8cJ9FtXZPY8XpT4Bo8cxQlPKhyfSlXgM2V6hZ8oOxvhHie14
         sK5I1mD0FtGbkEsgyMxmZA6EFKghwRQ3AMofLNQt3d3f9wCeUmwA6ruUzgxVBRbdlhFV
         7OEA==
X-Forwarded-Encrypted: i=1; AFNElJ9yRAJaTAFbWi/JRPzI8K16KdY8iQIzCmo72FLFADQ1UEjLmqbicMypN7n7wmofc3FDXyriEXJRbw5H8DMy@vger.kernel.org
X-Gm-Message-State: AOJu0YyGj0jUevnA1I30Ylme8odrtxxHPYpyD9+EAOuggAtN1QS3Rhyv
	LC3xwfP3g+espIr/LybrfzmU0s2P2phbHMgqLkPiVodFdkE4geRvSzFoLaORytnsI3bqg1BCB8Y
	pOZ8yhsXs2nAjBu1nhIBt72nb5Qdf5ebh7LzNNf19568x5D561Vom0bA1F5cqAt3Hh69s
X-Gm-Gg: Acq92OHTITUCdXrhs6n1LYNo7J5rUlyXIJKIo9eKA4u5Kzarzl/IQ5pK1qepFxhRQGH
	MlUd2Bwsf1gPVP6sZDdajOH3007+RzWcs4/Iyt8r1rZrE/rsU4/YTrKJqQo4Eq/QnggUBBGR/CW
	RDAOP3zcRDthdUjL6ANPSqnAEvzuCSuvhbsEtR/yD+rdyAjF1o8cOmvCKmqfuX5p3aM9c+R+qIY
	hHc+GW7YcrMtIyGrPzBjxexZ0m/Y5uHORMwgYHdIw3buvIMWSf6iyD1Z3cPHnVEC/okDCqaIIrx
	1dmW6jIQAbHN1BkCS8zMLus/KQcxa08wsAoq9UPERg8+UIsF467GyM4Rp0zDV5CmTVuNdbqb1yv
	LkC4RHleFvNrbTPNwIK9Lc3D51saDn90sDqmOMO/BhVN+nj6tHxVfPKH01lj7Tn7qaQ1obrNsHq
	4GtYvp2ZU0cREuRUZYcwBpzsJXuDrr6w+ORRI=
X-Received: by 2002:a05:622a:410a:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-5162ffaacf7mr38825181cf.51.1778676551133;
        Wed, 13 May 2026 05:49:11 -0700 (PDT)
X-Received: by 2002:a05:622a:410a:b0:50d:8e2c:6a68 with SMTP id d75a77b69052e-5162ffaacf7mr38824701cf.51.1778676550615;
        Wed, 13 May 2026 05:49:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:35 +0300
Subject: [PATCH v2 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-1-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHM/s/8saB6WEquRXdHgG9IkigEC1aRVfoTWt
 D9nJP96mr2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzPwAKCRCLPIo+Aiko
 1a9hB/9JsCjFIZQGxzpWMB1i9vzemX6fopt1L2EIJv+V/OsLNHMGQxTU3m0Cad3elaCrs0j52h/
 PFmcEBofEzAoS7F8P9hBndIY9jiDOv2IVnNnTjPz2JAB1cfScs+kDeM+njDaAmtalP/8d3GxUrp
 A0YOI2XhUJ8sDZgSA/4MxHL/ecyfN9BR1x3BaceHtAubDnQOEBrIIpLu4WkYZ3G4tOISwvw8ivx
 N/F2lEke+nGOIKWX7ToapIzjD+gQKzVf77iWPSGtoOqFK091OKWkvT3aTn5Xnit5h2ZXPEaAj2D
 ebiz4L7Dc+/JoVy3es5OUCEpY2XJ+FHrWu5/pa4C0SpibmqT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04734d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WCGayPm7JkNsTngyNM0E6vyqfcjyg2vA
X-Proofpoint-ORIG-GUID: WCGayPm7JkNsTngyNM0E6vyqfcjyg2vA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX/PRjwmJZ4X85
 WDsCjXZzn3CU0cUJtatItFFBwpBmIXqjnQTkhTcFl4lDYvGSvzKMiUTWlrtBmW+aGLh1wZLtNoj
 s9A9eKttl3wru0qcPyxxUM3L94x3jZM/Z96te5myYpUhK8B0T7hDNXUk3Ic+GKNUsQeR75aZifO
 K3wXbR4WWSRmkTvJwEKYx3YUSTQD15bwJsThGmSIVwdDdFJpLWCj7xee6xaQFnyNtnUSYPTUdS0
 oWlWULTnhqV/UjKaXbXf7VKbW5sD6tTLK6x9nWZcmrRgw+l5jtmOZHU65yBwW6OxlLS0FbzRRjN
 HM1fU/LVg9Rhn5rFYf6Me7skMMCybpzMiVsSDuafl9puGjJpi5DHRl588184xvhwVifRQkaCb8/
 WO48ty9/txDAMqg8N+h3j80kb11SPoX9qwweXPdae1GDgVNCIvRq8mDFXhr4ONPAJ1IHbmAHSYi
 yxpIjJDuftif3qSIy2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130132
X-Rspamd-Queue-Id: 524E853376D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-107291-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


