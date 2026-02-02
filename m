Return-Path: <linux-arm-msm+bounces-91525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEj2DFvCgGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:27:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE1FCE33F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 16:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B462D3020EB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 15:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EE037B3EF;
	Mon,  2 Feb 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZoqAc+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E01szgeK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F736E499
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770045874; cv=none; b=fsLGtAfA7N42+o2H4/WDbmU4avkKSgJuFLpY2zPeGkeB5o/od8bP9/Zb4H1YRhdcLNJsgCXNvp1actfAupExyNrlxu6Zu5/j/SxO2amssg1z6f3JzVOww5N+x9FhoLFeViuhwpdVJ3tOuj2vjaIQCZkf0bG+MTFgCbrBK6cyENE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770045874; c=relaxed/simple;
	bh=vfT1tcLU7TlKpr9DWxg8Ld9JpOc3RsUi/2EutBZZTVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/UL6ciqVNETZNED0WFmsB+NMYzLLqKS7gaHCodJhJlJ5kctH6tsokX8Q2+UiL9hcUCfB15dWKooczIjEUkh0RxRpsA6tXFUbzzMWJ5KQYLhtwQA3z3yJT1QjJaB1ADbiSnbnWJPaTYdCVZ4V0YUdREXAyxK8Lkor/Eez7YEHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZoqAc+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E01szgeK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612EslUS1774913
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 15:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xuAB/aSdQx719HfPcvH/r4Wn
	Qq2zb8+m9cWd9HNsaIU=; b=EZoqAc+OlFGnWvQy9qRTb5zu79/gJZgv0W/R5qww
	O1/mPEPht5XWaIF57donUqoYPanPKNkGDo05v3RM2H0hQYdwTCAIFO2tWhpqvGQl
	ZIe2JKdb2be+j/EeKRfekurTo4RUxc4UG9KqVpfbnO/yKH+tE3NQ7Q4lNPxNe4cp
	Xuw3UoEx8ChgCEcKr7FXys/EOhYWKjTdMhhgnYgHTJmZsjrDs6ZhQ3Jc+U87LIFo
	H3InlTf61RlDpXKaEsp9camHh76ctRtkguu5tIBjO/Fy75YFnNXR1Oc/yaXBKVfL
	jUJE/6d/RKonexo2M5fKdZ1+UrLLmjP0U8ucfuNoZ5UqGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1kmke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 15:24:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so1246998885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 07:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770045871; x=1770650671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xuAB/aSdQx719HfPcvH/r4WnQq2zb8+m9cWd9HNsaIU=;
        b=E01szgeK/lJ0Na6h+b6LKAzAchhLuUaF5/4KmfomtVM32zbot+LvI3GENzjuyg0whN
         QNbuexZtj+RdtLDzKNcJsiEyTpkH3GPlf5cStaT0a/phtRIG6CH6lNru/RHlWklDc5/h
         tOepcuko0BZ8iHwvu/yyISrYZuFu6ceSvVSTJn80Fc9wKfQq5yiMkSZvIXg3XUIGFO9s
         5L7RdrTLgDFjibdunElFnj4uosgZpeyTPD0YsnbdqOyWH3F9fSZbuo49egdYjY+YkyyF
         zJSQEIGLKsKKnMUqO90Uqk0nRJQU/BY5NlL73r2k5ne23y83Lu4uoKLJhxmU8BxIK+g1
         YI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770045871; x=1770650671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuAB/aSdQx719HfPcvH/r4WnQq2zb8+m9cWd9HNsaIU=;
        b=jltSVczg2x/vmioTuLHSzWeI/5N/g9HDgVK3JKiXyoYFU2iXFIa9TGTtbOaKlx+ghI
         1YaojHqr3CXtJUqq+uaf99YHwxdAMvBlY9Xm0Ylkd8wF1FWEadUdp4zti/buhYwIZhAe
         VEXFqmUs9AW5xC+ruYrJuq1iqOK3Gh4IYtWS2xIucfLOZuPl1hzUiTxcKq2HB0LeOHT5
         AuvcU7+hkn8AgtPDrHO5pQ47tpZjiQIFbH/0HM2n1VyC/il7FEILyvZ6Ge9imTrjii6R
         xeXg9SZo9c5FtFzbEZuqEEIazzp24kfab/WVvTb4XINeuRHjm4uIPBkQPeI5V5ZfqwQe
         UrUA==
X-Forwarded-Encrypted: i=1; AJvYcCVCRtdT7L4ybF2JWaoxSaKQz/3NY9oKopSDYW7CHaHYazSZNZ9bEwJmnxU6pXmkEyILAQNlNRjii8woEmed@vger.kernel.org
X-Gm-Message-State: AOJu0YxlSZQVZi8dgXkbcbggyto8yUvyBGBOtZZJZEgbcANCw/PrOZDZ
	ayV0SingQVgl2niBzenBoFHIMwUi0MCEAt+KBwhjWKcxOqrDve9v1bgmtimlj8UoUX1vHEwMw0a
	IyfKjuAjlIUzvU/lRhIx34NyVd70Y/CDzbAQabVwXVSbvPK9XXlirnrpNfpAyQ2k0GrPa
X-Gm-Gg: AZuq6aLSjenU15l2G4xek63vrOtZ0mWiRn/ORqpqmTUudhE2YQsBSWZkEEsmlq7C0nb
	e6O9QIN0ZMbFgZTLTGm4QybsRxBi73OJ8s589CWQZLjyb07xUcXtx2POnm10dO5x2UWVkKc8T3j
	JzSyiDLtdjxZy+YNXW4DGCjCCBch2hZtMUheufeiMe86GEvl2sGSvJuxedoRt6Ld+anLy6IxP/7
	78yJhEQXrEHmswurk80EX0UAzITKUhiZ3BLNq72OGmg2uacoTwCKEPSan8nEhnKHrJNesck1yrc
	+stGKpAhGxlLvQ6wr1BXWRAEswpN5mCb1Moa+6WHP3c2Yg7OaeE9EqSfs0ikLMGjOMChUS9igg0
	hvcoUBHZXe75bZ3QEfU7d2Gi8
X-Received: by 2002:a05:620a:7017:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8c9eb33a996mr1226530985a.81.1770045870604;
        Mon, 02 Feb 2026 07:24:30 -0800 (PST)
X-Received: by 2002:a05:620a:7017:b0:8c7:1a0d:7d9d with SMTP id af79cd13be357-8c9eb33a996mr1226524285a.81.1770045869853;
        Mon, 02 Feb 2026 07:24:29 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm47121957f8f.33.2026.02.02.07.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:24:29 -0800 (PST)
Date: Mon, 2 Feb 2026 17:24:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Message-ID: <ulnt5ivsedctjy6shyj6sjlaa7ig5b44jsvvrzm5horzl2zkuk@37upvv5uaybx>
References: <20260202-purwa-v5-0-1f5a93578802@oss.qualcomm.com>
 <20260202073555.1345260-4-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202073555.1345260-4-yijie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: cr2pZTG06NLjLuLZtEyh-2BrUD7-8e8P
X-Proofpoint-ORIG-GUID: cr2pZTG06NLjLuLZtEyh-2BrUD7-8e8P
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=6980c1af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TSu30AdjdkAtlEphcj8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyMSBTYWx0ZWRfX8zJbV1w91vuv
 /VQ9VdiqtvrlHUVgKvMe8EwRZwKsceUXKdvX+YS95YbOCsbaQOUskyKYecFb2z5dfiLwq609giu
 z0CF23h8hzwu9QCe7Yv3qn8K98A12SzkcyNQkz4srF+MxLemErwtxdrO+9D2en/jvAYizWAfMf6
 33sc6s3DtTkObjIejnKfrHJFIIVgJEC7TmCK5cs8z560MlvWK8+lOZMSfi4OapGlvNYQm4KAoPb
 Z1QQjLohCInRXnejIAG0l2gIf75JY0OdE7ppQGZVv+tVqw3j8Q0AWZhoMsmnIn48Q8FfEnFPXzf
 rCZwY4Xqlo3IgFsRPAOQpvg52vty2QEjzqU3soUuii1kyCiV5FdOuW8AYht1+neTJVe+yDbHUF+
 HN+vNFuNRQ4sQs9L44rEvN1ri8ebC1YgQC945Gd5YoQ95fcdzn7Dkdujx3rxh1lcWhZQxuMeY63
 3hItPbvnmPWp7nzJy3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91525-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBE1FCE33F
X-Rspamd-Action: no action

On 26-02-02 15:35:48, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Purwa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
> 
> Make the following peripherals on the carrier board enabled:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> - Bluetooth
> - WLAN
> - Audio
> - PCIe ports for PCIe3 through PCIe6a
> - TPM
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

