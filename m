Return-Path: <linux-arm-msm+bounces-84316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF0CA2DEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 09:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEE0A301DBA4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 08:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7F8331A46;
	Thu,  4 Dec 2025 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSL3jfTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNcie8VW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6286432E131
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764838658; cv=none; b=WbRi4Kcz/svVTVygbvs6EDX1hh2UwdT9W08qTECwpDU3z2qqBv/n7TsMTOSzpYqPA/dctkCfz+Dq0JosaS8qF4ol8NJkjmxtTrEx5LZq0EH4vM3FSl7Hw8+xnkoESBp0L7BtAw88keW/uVQ7+wDbi8tVDS4kMWvai9pXZG+6u8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764838658; c=relaxed/simple;
	bh=8tjVzC92Ku6LBOQ7yyVJcYI8tJ4TxG/xvk7KTFvqY98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVZ0b+mqDXDCBB130DnTjHw/LM2GtkEHQWLK8O85uwN/AMXzpvGVdNWhI5FQWHTPwJPkMHE5yhDCjZ+KmWOPuEkEooBJhm6dImIcKYdLDASU5hswEoTai+SF+7cv6nTRRoGPw1ivRz0SBrPPL+Vu2Cs7Vi0uh5dtlaPoVmS6UGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSL3jfTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNcie8VW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B468iXc625290
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 08:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xICJ7I0+31kwSjnrDhNKTolj
	kZmJzA1RIJuvbqVd3UY=; b=pSL3jfTsVukMeLq8jSD6mbML1lmYA8vO8GKOKOAA
	wqAblrXwLnzsQmk5TFT0KDjeFK6pfhSOER8R6W7MyEtzWzc/ctQ82HhKY00w2v6o
	gF5tnV748sgraaSfxqfWvzot+dkC1kAupzpkGhll5acv53LPoBPx+y8lXDKbpgeA
	zNa4brBNMy6kkFP+v67Ti6/B2q8sOd/aGF1VWenuyhCT5ItnsuM8u9vSRAVUO/uQ
	kuk7T1rbuOhJSBs5hEa0GaYuD8YeNzwGOIR8tKaBQjaNQ+Bq4KgOXrpajEDGscMX
	JROukZ7xH37ZOh9ylcjAsv5NQGTj1BPDTbLmIQuC+J+I8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h23fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 08:57:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e4b78e35so141695285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 00:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764838656; x=1765443456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xICJ7I0+31kwSjnrDhNKToljkZmJzA1RIJuvbqVd3UY=;
        b=XNcie8VWNM6MAvHteGKi/WuX6ih+Pf7NvmRXP1tyPsLo88iOiYhWm8J3ou82o8Chb9
         xvmnRlLaFvC+jRzWuCSVv6exqt6heAY6Raf3JhDE+C3EjcPVDuDygGGePDHV9PSQg0Q6
         duIT1/7XHEAFDOcDms9wcwfo9HyFF81XNu/XIw0QJbcOOuiQ9n+j/ZTLlTsmr3OFQaZd
         qrRInf1InlE5t4D5xkrnR0CMuCZYqQcmLNXG1LertFvJ+0ytwdMNsuo4iXrOTQzdT5SS
         sMGEh0iznzR6yxpXFHJbfgbEzQamiDQxS4ThGZQvNvE6bN3SdHutGMZg2CEiJ0GDkf9/
         iCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764838656; x=1765443456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xICJ7I0+31kwSjnrDhNKToljkZmJzA1RIJuvbqVd3UY=;
        b=k9KjvKC/uGw0WIujwpdUt+gw97PHEsAMmQQsqa2sW+cwmTWrteg89tQVB5bPz5j54t
         vgA4+iNLUVM6mvJA/4JVrgKYtaygtfhDndNUTnhW8hWHocSBj1G0rl/x3CyiJOzav99A
         ZZhi2RX7BzjxI1KBel3oLGT0wgQ/RZaDdK1BjfjxWTLLbo1hdvo0j91U/X6Q0yCeqfBi
         I+Wm5s5h+2rkklUGgm2PV4NYP1H7Fh7UZGqYepfMbz3qFTdLE1GsMcpCYWrn7c+X1v+/
         p8e+JbCca9YTMnXone2lTxoGmVKbOUyfNGzMm3xCyX9VDfTVKfoANiO0OMSx6QnLpMfq
         IYnw==
X-Forwarded-Encrypted: i=1; AJvYcCUIeAn45WnKlE+S8131ZL2O9tL2ROfgnERL7PaPndrw+4QphKUokfHIMu/LmhSQxPmae5ytPJ5NVFzFS2ZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxkvbqNkU5f0ec5PoBq5/yqPnsHwIRQ3KIrGj9Evvg6BjLHySW8
	rnS0G5Y3U8KX4EBfHhqBG+90SisuliMOncPNroR4bvbhShtLOmzLZR4S6R0KUgu2dQU4IcKnNDj
	RrDCedllZG9mgu+MwCR65Nnf9/LupMaHfZd5hLFuh2/XNFCBAQDaZSNEbqaCoSagy7WzL
X-Gm-Gg: ASbGncvevJbL01C1bKNLREESNA2oFU9G8kLJcOKKIJWef0AKKSlVUvXC/HVSxYjt1+a
	OOFZF3HBFRZsjGslttDHECm9BcE/0awvXJsuvYvNv7Ps6iEFCfCDc/doBnGMg379qG20sna10UQ
	QTuX1YAvBmO8hB16XF2XBbPsPFx8/XWQR7rinFFCmtFc5ShboRuiBN9j7pip6dYisxXLBjQXpjj
	FemDKcnv/AzHIlGkr+MJe7k1SRpGjBMF+F7DUeWB8HnOEjfF3sq+ZUcK862v3nVKrzYYiLuA5Hm
	HAmbbeKP9oN4UnyCSdm3NWJV0PhGmDzVxOqTfRjLmNCoI/bGpLe15ZYzlOeCplP8FMXDv482cb1
	eg7O6cmE=
X-Received: by 2002:a05:620a:6914:b0:8b2:7558:409c with SMTP id af79cd13be357-8b618169800mr305206785a.36.1764838655698;
        Thu, 04 Dec 2025 00:57:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUhFq/ZFibq2s5zYzGkFo5RKQ1SZ51JrB6XLgoRH8A5PWbw/6PUfDelEWU+NTrDWM4zkSr3A==
X-Received: by 2002:a05:620a:6914:b0:8b2:7558:409c with SMTP id af79cd13be357-8b618169800mr305203385a.36.1764838655260;
        Thu, 04 Dec 2025 00:57:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f75sm2010209f8f.42.2025.12.04.00.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 00:57:34 -0800 (PST)
Date: Thu, 4 Dec 2025 10:57:32 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V6 1/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for
 sm8750 soc
Message-ID: <5wypgitbmhjinhle462zgx5b2otehzcqfm7fehsic7gjoglmkq@3rcewuzrpyiu>
References: <20251202081017.2234677-1-sarthak.garg@oss.qualcomm.com>
 <20251202081017.2234677-2-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202081017.2234677-2-sarthak.garg@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3MiBTYWx0ZWRfX2Gn6q+Tayv6Z
 fa28/f6HnlwnwaQG/4axUCq0yZwnR8kd7guXRJ6YhRUh9GEO0pgT8VPqDGI2OCQvrYDV9ihTZQu
 puV1W//VwvRKmIlwz+qffOyfuYJ+CJtjKoXinqrbuZgSTtczKXr91+8b86CTBD9S0V0qd9QXVmU
 Tb4rbELaltQxWOfIZIBnQJtqSlTD5CD6Mn4j/dvsCvwRnzYwNvHt+79jzwdx7FHmFj2sDmZ5Fnc
 HWrtsDXBZw8g16i+J7/oZMViZOtxPRolIYAoIgmx+Ndk6cXOC5aeo8bS9UnjgyZm8wwKnkKkGgq
 lRBaFSjyLQq46IKkAuJ152BxgRhAC9aq9PHD1rARoSfesPjvkFcRhhXV2R5B9j5LVEoC1w8qi1X
 5pXoa9XSLFoLYDm0DKBoqPG9L46BbQ==
X-Proofpoint-GUID: iENFyewBLo3Wp_A6Fmy881I58-MUNr8q
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69314d00 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=C_7bzabjvVxi82VMiCAA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: iENFyewBLo3Wp_A6Fmy881I58-MUNr8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040072

On 25-12-02 13:40:15, Sarthak Garg wrote:
> Add SD Card host controller for sm8750 soc.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

