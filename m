Return-Path: <linux-arm-msm+bounces-81557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3EC5679B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C23D4EE45C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77945331A4E;
	Thu, 13 Nov 2025 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE+5hGSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3J4baSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790D330D32
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763024112; cv=none; b=PWlbltZaWFQIrYIDEbfsxp9YdUjoUGYU/2K5yhv2xJiI4+6KR3vcOVgFkk19hZLldJtUFJoRbaKxRf/QSF0HF+WwctYbKuLWovL6KzaWosJDOdNE9qrr3E2vf2g0MaRoQTwJpJb5mrwAp3CvIhiXi1MKmjsHZdHvUIN019AVX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763024112; c=relaxed/simple;
	bh=yS/Zqmsw1pub5MxoEyCsZ9T6aQWl3nSZ0FCcfD0P/+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bh23F/o4x7e3ObGc0DZn6M0a87Qukm/ZQzO0f2QAwtPjR1sypaT3j9VsbsSawcMpmwzwjUBDdmRbJp/W+KdZmxa/ODhcyRj86odONBaME6jqpV/RVoUPWOtVlntciXfhlt3dLustISL4woSlbkPW4NNvDXKLJfbnmMzDmiQDHso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE+5hGSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3J4baSL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5qOYb3764325
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4v/Fq7VW41o9w6zoYq+6g7Om/dcBe/6lWVVO7aFJcis=; b=bE
	+5hGSfdFAilT5Gh1ikzSOjECTY4zxdNgucjB5iI9vN5YgBfC5AvROThx/gI0xtNg
	NnVA8ntDIPwwcdwLl6x7RPTlGiQJ5hIAo8VuY1tp06pGGdx+fPWmlIcco0t0+YxC
	Avr/nEK0yL1nSDCtk8JVJhlkHF03JJjO2go0ct3MoknV+D8XAlp2JIgFYwZ6AbMv
	qqYX8OFNPCzkBF7MmFkzps9vWTIgtQ+gfl0rdk6EZcbLNLw/3dpmx+WiDkfGFojI
	LwERxCBYnMuZtGtw0ULNRBHsobirMkgQ+IprKLp8zSeEVEU3jSVes1r+htj7VqoV
	3kGW6vdO5Rdl5F6Q0vag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9jn0hgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:55:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso594775a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 00:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763024109; x=1763628909; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4v/Fq7VW41o9w6zoYq+6g7Om/dcBe/6lWVVO7aFJcis=;
        b=W3J4baSLkhvZBWo853UKQVyp0tpA6Bitif89qLpjq/HlhTHqhwjKvlnFAX20WzzcBn
         fcSDqS12wFRD7FXw/l8QJZzZQy1Muw6zoPUQ7SxU3MZH/4mTxB4/ACIpeL/RBgw4IF2d
         pf7y1GwCTzVIXgmH6PTOdNrxW6BSoO6maZhvDuhySxJxKL5CKOA6396Nqoem547k6g0M
         wMRWVGPXumHATKHBpUsEPBW0LyeZZ4iz1hB7ENPQCd72JAsP+f6ennXMmy8/CZc5Gum9
         hTjNc2wJ9I3amXqSkh0kutljEaQb9OObfdLkrizdjeqlh9JoIeO/wFP4kLcmbABkmGM4
         66uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763024109; x=1763628909;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4v/Fq7VW41o9w6zoYq+6g7Om/dcBe/6lWVVO7aFJcis=;
        b=OBFAtOGprr8Nlh4mKROMfu3jIl+QQBsmjJLLzo0XOXizq3CsZ89XS43Anp2vLED2yz
         2HLLfGM/dFdofU8RgZ5W24i6gZmbxYADZfhvz8ddGpfSR4SuEaO/+zqnDUSVYR1rKnPw
         Bogx1/HhZ5IwVqQvWGdnRsIRG+r/+RvxyTqFvtky68n6KNl/Uh9apKLIMbwMcc557ZLi
         tmrfD49urvOdoX0Hbr00u1gBcto3pV9H5WaVx/5Jrx/nw34BGBhOPobUF9mX4kTeGaMI
         oP4KCTRoAbQ5IhRTHLmdWFiXtUHA8MLwv+dxs5NGiWAcegdhU709nuv21DoNoBIdZVTF
         I8Vg==
X-Gm-Message-State: AOJu0Ywd+sVVBLIvG8uP186ffqEDEpud69VHqcHt3lxGj2Mvwn+S9rE8
	nnt17UE4qPJuKaaDyFrBoaqSiGcDIeTt4HUedqKSHfr+kATp0tz7o0Qscr3Hz7JmZ48LwNRWATG
	OiQLcHYraXm8PUJXa+NRcj+48wMcE9gnFgbGhCunBAsGR/biijNhmYLzbM9ml7AAXTabF
X-Gm-Gg: ASbGncu7VJ6uutCgPeDGygQJwNuyVRTGOd6K3L8eyxpAMXyTWIIpY6FZIZi4MldliBs
	HcCFk2sZ20CKqhIv51iyO6BoB5tkPONNPUzDwgWP52lhhWXAa6+s7DGbGe3Zsw1EYSUqpcd99Ri
	vjCfNOEq2P+IquccqEmiVy3+gJady5oB2Y7HS3GV4VzwPDJSaDiNM8VO1ZpwpaBNCB9wc7bDGEp
	dLlvzml7YJuCC4jbSgztjMrpKnZtlWgY5MPHM2MT99RkaPyRVpyPc2G0LclEksMxJnwK4Y3odEK
	s603e1j8ZyXt9w7yn3i6IeZMelXAhg9iKJjilB5VETkhw/fFOk68BUisgaN13C3H5/ZmvaX5zqR
	Dj4L3Xs8fGuROZhNb2olJ4N3h3tHRF1cpNqhT/TBy11V43yiR
X-Received: by 2002:a05:6a20:a10a:b0:33f:4e3d:b003 with SMTP id adf61e73a8af0-35909f74f15mr7790749637.25.1763024108851;
        Thu, 13 Nov 2025 00:55:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESdjOq9qu1BkwaKsDbcGdpq3xI09IK44dcLHktdSNqVFansXAWCBUGQF1Eo6eu+xMmevwqOg==
X-Received: by 2002:a05:6a20:a10a:b0:33f:4e3d:b003 with SMTP id adf61e73a8af0-35909f74f15mr7790723637.25.1763024108379;
        Thu, 13 Nov 2025 00:55:08 -0800 (PST)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b921cb6f44sm1592971b3a.0.2025.11.13.00.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:55:08 -0800 (PST)
Date: Thu, 13 Nov 2025 00:55:06 -0800
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        ananthu.cv@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: socinfo: add support for new fields in revisions
 20,21,22, and 23
Message-ID: <20251113085432.1309629-1-ananthu.cv@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.43.0
X-Authority-Analysis: v=2.4 cv=BvmQAIX5 c=1 sm=1 tr=0 ts=69159ced cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dALc9j6rFnT5Ke-xxj4A:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: blcWhO4dhC3GuLSVqWjoaf6NiXtJcoMQ
X-Proofpoint-GUID: blcWhO4dhC3GuLSVqWjoaf6NiXtJcoMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2MiBTYWx0ZWRfX58owGEggc1lJ
 3+6FMJ3uMvrEpxBl+Q5ibiR/PVntg3ROUk/y5YgTJLzkx8ONpaMtcQvgSEySJscBrUqJYVEK2K1
 u8mxEB0rWLe9TxA70vGdde7mQL9jv2ugv+GZZiSpQTQC2PSE3sVD3Jrs5ZysOXRgdskv49Yi/Mm
 oMpWAsqCX6WUTcfthVzqCSZeyvt0lQJQYofKSYTMm00dRtV59QTh4w50Q1mxHM3EvxsRLJaCIid
 X384GwSAII2Y2tbTVbykU6C+JkCDXa+L5RqXizIqRTTxiA6l0ZajlzKsXZF8vWwRbHeXbBJMgJK
 5EUVDkcwYI0okzr+CkPegMbS0Nmv789cJ744kq1jRaNEb/54omQRdG2hOAGrXFpKLxDTxS4nSJc
 SyearYVaP8C1H0CzH5/q+08MNcE4kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130062

add support for the below fields in socinfo structure:
- v20:
  * raw_package_type: type of the raw package
- v21:
  * partial_features_array_offset: position on array indexed by
    ChipInfoPartType, each bit notes the corresponding component being
    enabled or disabled
- v22:
  * cpu_cores_array_offset: position on array of cpu cores per cluster
- v23:
  * part_instances_offset: position on array of PlatformInfoPartInfoType
    structures
  * num_part_instances: length of the array of part_instances at
    part_instances_offset

Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c       | 4 ++++
 include/linux/soc/qcom/socinfo.h | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 963772f45489..a14aaad51f81 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -621,6 +621,10 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 23):
+	case SOCINFO_VERSION(0, 22):
+	case SOCINFO_VERSION(0, 21):
+	case SOCINFO_VERSION(0, 20):
 	case SOCINFO_VERSION(0, 19):
 		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
 		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 608950443eee..40903c54b526 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -82,6 +82,15 @@ struct socinfo {
 	__le32 num_func_clusters;
 	__le32 boot_cluster;
 	__le32 boot_core;
+	/* Version 20 */
+	__le32 raw_package_type;
+	/* Version 21 */
+	__le32 partial_features_array_offset;
+	/* Version 22 */
+	__le32 cpu_cores_array_offset;
+	/* Version 23 */
+	__le32 part_instances_offset;
+	__le32 num_part_instances;
 };
 
 /* Internal feature codes */
-- 
2.43.0


