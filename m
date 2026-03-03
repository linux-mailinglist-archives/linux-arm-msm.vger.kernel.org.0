Return-Path: <linux-arm-msm+bounces-95118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OL7C3/OpmntWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:05:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC71EEF3D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEC2D32091A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48BE425CCD;
	Tue,  3 Mar 2026 11:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzi58NQ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gykl2t0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E29426D3C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537166; cv=none; b=FgV1SAHL98B3z9rb2zJe9Z2BEEYYDENQFYGcHT0g4EbOoRjmD8O0O4P5ADyHS4BrObSCqeTT4F4lLS7y3GOJtb5Pe0LGeJ8wAB9o3qySkQots84uycJwSGKOmxg4XlgYxwfRWCMY/AeVkkskJe3i/SE9ZVgcc6AX3uJKZzMQ97s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537166; c=relaxed/simple;
	bh=swPtd6qOa+PdreXJ2qkayT81wvg7myqshv8J/8w1wLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m8sKYrphZZSihgBGaGQ/Ba0sYL42sXpoMlQPwBqrNsenF4dHpCYWMCEt+aDXcyyXLRGebB61rHxvuoGD8+bH6m4qazbsunqO4NGo1lxuIIlNLcy759BmBNsaTeUwO7EW3VVQJwkV1drlwCEgL5XbJ5DIXyhZusSbwP80FIS7EGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzi58NQ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gykl2t0+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nGae3349609
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 11:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M2ngA9x972ob1U4Z2Cvp2jGZydYFzdvDgc3quauSCU=; b=bzi58NQ/VVf3WrXu
	iFK5xWphBgyZu067M+Ki+CKAVQqnMAiwQN8kll5+CxyrkRgu729+3Euedaf7V5oY
	3appOb6I8oDgF0jAoJkc+XyDePw5nofgKW5Eif/vtVTXvnAUPRo13EHA8N2ESrn6
	j8idhFNZzkc49gm2dXYrW0fo0WTG0HMtPUp79ZnTH8fZ62CPvafAxDvgZ/1MEgBr
	2fPRiZV8aJrjohiAkzjYk07Q4ovfZal6HcXLIms8dBqImr3BozbXd3nd6hZ2WtU/
	RD6jgl1EUfGFemIVU1eadRB8ylivDsDIs5D0LeYOC95rrAioua2IZANAUF1uJivv
	Q2VCVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsajm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 11:26:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so53680385ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772537162; x=1773141962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M2ngA9x972ob1U4Z2Cvp2jGZydYFzdvDgc3quauSCU=;
        b=gykl2t0+spGBQ0+DsxZ4O6+zhqL8m2IRgM+58dlrVPhmCvNOJtSddiDpL7pGx1vhOJ
         Ar+mMLWZ/4TK3AqIa8hrDgYvVdxzhkthBwLrIm18Xq4WPVCmrG5SpLbj6QCVcTwFO1nP
         N70pVLCG/lA1He1iPaGA+v3rVirtwttP2Qd1KxirEcyVtXk4/Ea3vERJJSF92aw2Mjc2
         AwFHtnS4Le+w/hbBKAdGFh3Z/iJRGnG8PT4a1uL7fKuJ1tzblEUuZWVbcBfcqO99cACl
         d+sFGproRX1RbYmdt6iwto6Nsj7L3M26819xBzh5Mpq1vXcfoNAY0PjBMNbD5UNiAgT/
         Hw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537162; x=1773141962;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/M2ngA9x972ob1U4Z2Cvp2jGZydYFzdvDgc3quauSCU=;
        b=otWiCpy8RjVBx/pzrKK7q6S3M6Wtdb37ZUQ9np9H9/XAM87CAJqYl1BPZh9GGCx0Dp
         8awlTCr1Zfno2lXR0hGJ/UEdaDIIHI7tjWCNTg1c/otiIGoyv7JixyS7PQcWVa3Hld4X
         gxbLyey7nbWuHsp9yxxuT/RnrvV0wb6DlmkB04L/Ouwmaf8ACeCiKler4ZziBq7sEC8W
         3hY/fCWkOM5CvhGaDak0ZwQRnN5org8+Br3KhxAL9wQFgLMSg7okihfjxwuW/x3sTtPE
         Hx9tNKOrCMqGPqP9I53b9xDbrkhcfxER0kdSurP8iwCgf096fiX+drbdyMGaQq2CGjcB
         +3/A==
X-Gm-Message-State: AOJu0Yxhk7gW7bzmPle4DOl1msmeu4jZ3hHZNYGRuMj09pHl/pr/d5XA
	NHuP+DpoXyqOxK4e4SAveoGcMAkBYj1p0ib4tjVn7/PUvShwZzeG8W6uM/7JJIShLAHOZoG8DF5
	h/ektu3xrMSMJ+caC9Qd4QuPhIx6dL7o/YXXMZzP0IAyn+MCo5wllKj1b5A7oHxJkSW5R
X-Gm-Gg: ATEYQzwisoHfORsFUVTATv2zhd74D8CL76tqwxABXAIJLIL1ZHMgbldsdI+j5oZV2HR
	UZN50bAiPFbE3uLB8GSqLvboZsRr5Bcnbdk2FVi31LgfvEp0qD/ihVqezEJMigVVhQPW31IY9lX
	l3jOHVY7ZCnRj7JJeM4csG7dIrGKObnhyhMjTTGwV8Hfa6KZOMJ5xUpr48FxQCAYB92kC/8gTX/
	OvDlA/lf8ijrQxNOmoPfTNIDxyXPOFINblYYpMC3Os5jJvKMQjpht4vB4/GXcsdP7HFp4pfXX7a
	2p6lB4JXT9gIaMnJsFzBjt/R4JbXQWtP3G6Wlx5nCh+P4WDmJyaawy8w9BPDrWxoZGlXxSDsAtC
	7C7Y21X885vAgkYDT2KNqWF3vVHbnJgstMpgGi5SZ5YLWSsayyLescND8jcoSyzM3K7OfeaexXt
	hpiOAtn6jU7fDl2KA1mE8=
X-Received: by 2002:a17:902:f543:b0:2a9:4698:2577 with SMTP id d9443c01a7336-2ae2e3e3cc8mr153061725ad.2.1772537162397;
        Tue, 03 Mar 2026 03:26:02 -0800 (PST)
X-Received: by 2002:a17:902:f543:b0:2a9:4698:2577 with SMTP id d9443c01a7336-2ae2e3e3cc8mr153061495ad.2.1772537161935;
        Tue, 03 Mar 2026 03:26:01 -0800 (PST)
Received: from [127.0.0.1] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b416bsm170426165ad.61.2026.03.03.03.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 03:26:01 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
References: <20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 0/3] arm64: dts: qcom: glymur: Add USB support
Message-Id: <177253715785.1524003.10186721451358817329.b4-ty@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 16:55:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: a0y46OkBjRarncQixq0mZ8Ot03oJ6AGf
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6c54b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nykp0w8WpVuyzLAiQ0YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: a0y46OkBjRarncQixq0mZ8Ot03oJ6AGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4OCBTYWx0ZWRfX8qFyMihWF87n
 UiDLeyjdaEr7NVzd4FO6jWLlKELcACnigRCXpO1VzVoA95e+NvnLRRIwb2wcGE55MT/ZhOzkVYQ
 AAfOAQPaM6+diqKGgW7IcmlqEuJcHIosWTXxanG5FdkyQ5nxl6TrbaGRZ92d45JhJKVXUTneO5L
 YmkC5lSChAKiBi7r0WYrFIvCuqFxEgJfGgRlurO5LthOk5uwEpCEVpkIzlXVH/JL5g2fylO3FoA
 MHKju9/JfY6W6bZpHyiGUmlgM60UBF52RVN/e+R6bYfwn2t3t5I36dsYTNwZy/VvUwsPRFpxhIu
 Sm4y9LJ119oUOUWLJud/saVX0ab40eHjLfPqkbCAepSa5Svnnz6KmP74xyIzmGKSjMpYd+j96KW
 RSUxt1UvHXwTnMc4Y1MNbO5KXJ23VbMPaatMPE0OWyxSdztIfSPxoySRjV1BRH/F8R0A3Go9h1m
 jE0vGKdUGUZ2sEDRqiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030088
X-Rspamd-Queue-Id: 86BC71EEF3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95118-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Mon, 02 Mar 2026 19:09:51 +0200, Abel Vesa wrote:
> Add support for USB on Glymur SoC and its Compute Reference Device.
> 
> It adds the usb_2 controller on top and addresses all comments.
> 
> This unblocks the upstreaming of the display support, since 3 DP instances
> rely on some clocks provided by the combo PHYs.
> 
> [...]

Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Best regards,
--
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


