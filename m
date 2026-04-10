Return-Path: <linux-arm-msm+bounces-102699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DjvIvke2WkAmggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:02:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A73DA02B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF6F2307F4D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249DE3D669B;
	Fri, 10 Apr 2026 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eAHpwEbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5Y6T+Gv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E002A3D6694
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836567; cv=none; b=iv5XQXLmE85XRoY6NqFRxyXI9W57lDmZxv8EFCnvsWU90ckPZMsDJcnjjzKETJj1XkEl82DZyw9QFGgszkiUHWnaUk3FMYzdCfOcrMkCOKiKpRjFywwMvXbxNwDs6nIYTiaqFi9GoJNclmUi71/5oOFFrHIELEhK02H2EJZtuHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836567; c=relaxed/simple;
	bh=+GZuJTb0iMsl4BoZhYe3y3JxlxvYISX/fuuX427Ffto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAREayYICua06ofa8R8Pb5zuHIxDDztJheHur4/EruGslCPz9MfD5UKl+LYsstPCB5RuRzqjjjVeSEGYcISY1MlKbzh/7LNLkH3zj5J91AUJLo6u84nOITV30PAnN1EdEueY8WQsAaOJcEE1WTPbdX14bbn0Lhdj9VI3GzJE1Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAHpwEbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5Y6T+Gv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB12DL438864
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=azMtyWroEh5ozJjlVPeZSbb0
	zZ2Obb2WMFwBowLkgIU=; b=eAHpwEbpQXllmYFeNxYgwrvlVib8+sOyBj8iy3f+
	7pRmL6JsWnt9cnbbctfsDjuisA6tiILNFeyA+GHtHpcYuB7eF4a+lvtF8ur12CwE
	FWPvBi1DM0g602gaLmitscodJbI0sMxr7h89GhW7q/mK0lqlSe1VK+XJOh71eusH
	WEMlX0grjWHvkgTsJcl+JMxjdqpgGKJlHn/3E0tZkErdayfAM2z1ckKZ5huXXlzs
	QmQdobo9nxwkTcLPyiDtDHTdqkrE2lFqQrVjTLm/je/7Tw5gjgwogOJDcgFvBJc/
	NmJ9tbW3MJm772/0a/DJid78nlvbaL8DycsLiM4RId7TuQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9rwep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:56:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-126e8ee6227so3094817c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836565; x=1776441365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=azMtyWroEh5ozJjlVPeZSbb0zZ2Obb2WMFwBowLkgIU=;
        b=Y5Y6T+Gv6oVS02HMFl/R0swvU3Zj2n1aXXYHCJ0DfefXdDpsH/Ro3aRVWz3+Ib4pkd
         ZgHeNns3Dlc2Nv/tPl51KjKsaSBOBwpROol5wDbaj8vVCZ6TZ60CVseZ2H53iGCB5b1u
         Ai+7N4wn3w3rxq3JmEtPw6iDwBIFX9ySmZK8jjNkT+s37f7lTwrdN3eVRXH2XovFe8jU
         VAqCNOVgs/+OVKLzR/avvmFqTRt+lNNzdkltYMdWDQbmMAPfXoPvITGabY9qMVVV51zZ
         2s3Grb9q1osoPoqx8NJDexlZAIzZh31ettPcp/WNgKgklfuJhNKBViyvVhBZTAGgjQuJ
         esHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836565; x=1776441365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azMtyWroEh5ozJjlVPeZSbb0zZ2Obb2WMFwBowLkgIU=;
        b=CBiM86bf/TtPoJYIlJNi9sDFX31ukHx4RV26VpX/NlH9vLFH2CEE97+75hBAoKdQe2
         pxkSCa/VhiiW988GXxca7diPmDtD3ikCykPoY1cET1RU4vjkICpDxpSmzlyIwgMuWWRR
         WZDdqcaJnXe37vOz+oQM9ps79noBcIFK2lQwRkypED1kzjDYnAWYNGvUnpEQzazmoY9c
         E+y2dy+P5tPKU/AFTwu7pgRtinQRavD4/Bh/zLgoZUL5PakxMOD1wD0QJDIAoxdyQSW7
         qlL3D5d1kYKtLmbyBSFlDbkGohKXOQqUjA43KAO/JJp1UHB2u7pON+P2Sxxwe71POMkp
         YB+g==
X-Forwarded-Encrypted: i=1; AJvYcCXw38TEEip6isg1reCl83UbYVbDAr+NeU7Zs7QSAEO6YBVe9QYMrwQ7H9jZoLiPXE05Bu6tLMvjEDLUWnkm@vger.kernel.org
X-Gm-Message-State: AOJu0YypU0xjsl9NaBfC/WSkK9+XHA5UrGWhy55ZzDF5mVRTQvVTJkss
	IkxyQsDt+pLxk/Wed4apMBFHgFC/06jLcK/wsEpps+QeO0c7wb90aKb/4tVOk4/rts0kM8S1ku+
	ojdpOMkiya2IGUi1kgODLYdimKWM/AcvdP9u6+2FqC5mG2B+Kn3zNX2umKuFVnotEBvZT
X-Gm-Gg: AeBDiesDcKBUGO/E7uOhHbHWz31FBhAfwS55BOdmWYi3TGTZipOrJTkD1OGEYCW/4an
	23+SG9n8zJCe+XOKSzu/w4ZrdYQWIHM1spY06YNZeF8XNUXNE0Hrr2pRiD3ZyXN/QjPsOP+q5d+
	2ayO6BpiRw0DrMGp7l+cqtHQ3eknlPam7fAyyCqfWTotLKtNGqOFGHrdI1YSSxtTvrRBGUzM8YQ
	/8YW6oGyviiK1GQ8fhXmti++DJJY6fOoOy1s8a/VMtT97NL0zK/Ve+PFTZcYeicaM/n5n+7kCYi
	sB5lA/XtgMgRx8YrArWIG5NwrxfLrtn7zKQPGPz0t9j47UiCrdSIhIKEGhZHQ0j9GSrXf15g9C3
	Pi4GU120zXqJ+o026Y1zMECyG+CwJe/Xi8zOSinSb4o/euFG15/gsXVdXqsJBhzMgFeKv/dPcul
	0=
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr1935202c88.14.1775836564627;
        Fri, 10 Apr 2026 08:56:04 -0700 (PDT)
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr1935173c88.14.1775836563921;
        Fri, 10 Apr 2026 08:56:03 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm4621453eec.21.2026.04.10.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:56:03 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:56:01 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/7] dt-bindings: clock: qcom: Add Hawi global clock
 controller
Message-ID: <adkdkYovFBQytk+n@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-3-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-3-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfX3hYt+LWjGwLR
 JQShmisdfHo3HAcxg9X85OXmAVO9QsyVi/fKfYgkB3CoXGgZNdlJu6zb9ebAQOZ4O0Vzls0cgtO
 2H/WI2p6OvhIziw0a4377B1Y6r0G2Ufqep4w/cCZJ4Ymzi+YrsJ/KRC8fV1DFU5i92XFMdPSikB
 ClihveiMxM1pasvSofeSB+NXgcSKmin/kY8JLqa63WoTrXXV52pVxalfHMP8NVH/1OTwW0Px1vQ
 cdVJAUTT1awZPxm9u7SwoeqkoKq5S+itpbnuPNP5LulSsq5zeZ+UKxKIqzJQWyeqy2cUS6B41nb
 0gvOhG4sCATYWjT67M/PLNREJhsAqZ0VvvJYjjZekPxpHL/xhBZHB3T+XCD6MlcpksETuKHeRvY
 HXYiteOK7Qjulz1ZbSpTPZsDajqGMQHp3JAc74U0RDLgbJ+LmMsATBISHGkrMzUvVJIxWWnmg9p
 Tb8x9GSW6P/Gss4k1Og==
X-Proofpoint-GUID: 2icz8CcPGeM6uAjHut61_wHq0PYbZUGA
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d91d95 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VF2_CLY_OfEEnuuc5wAA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 2icz8CcPGeM6uAjHut61_wHq0PYbZUGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102699-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mdtipton-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B5A73DA02B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:51:37PM -0700, Vivek Aknurwar wrote:
> Add device tree bindings for the global clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |  63 +++++
>  include/dt-bindings/clock/qcom,hawi-gcc.h          | 253 +++++++++++++++++++++
>  2 files changed, 316 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

