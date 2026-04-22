Return-Path: <linux-arm-msm+bounces-104055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF6PDweV6Gl9MgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:29:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5B443FAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33CB73020192
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19663C2796;
	Wed, 22 Apr 2026 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hx9ccA45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAza46W3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DE3750CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850179; cv=none; b=WlSJjBHOj9yEraOhSNWu8h6/Ty+IV7nFsw2wTHLBLqmeIBj1Hs2QAoRpz3SrLQWG3VcHPF4k6PLRaDMPD5/mg8oQxcb7Yz+odjbl6UMjAxy2XZsQOKgVuga/lS1crQBi82KQettFEDWuMDuDtIXIu83YbP2q5j82xbbUho6eBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850179; c=relaxed/simple;
	bh=W1TxV0AzdNsAEIY1LUXd0/1L1NmsY3+g+MLNlWS6zLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lG7ihkEijr6eh+synXCreMe3mrMmz7Mb8Gaqyc/8+ZUu5N1uWK2Adt8UlyXlp4B82/zZiNrl3ry/QpKNu5PvBx1QGCvnTfqkihn1bJ8WbJH6X0sKPlETcqKUBegvwueN+lCsEWC7lChhlxCAIU/gXfNx2PukeYMFzSHU4ua5ToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hx9ccA45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAza46W3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5EURt727986
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQuZX27ltGNuPMEcg8XYzIQnb+j1FapnyW44Bx4mBfE=; b=Hx9ccA45sRbsO+YM
	qHjOCyNwRfs8WOWM21mcq1WAMy3w7R4AWoLNDn/oO/5jrv5wh4KL4aLy+DNCIGMD
	P/SCx5IC5Tn5VElvaClVLxmNJsc3LTQLSTZVTkPPWru4wT/o0x174a2771D2gwVz
	EWcDrfup5Qhpi2jGzt+0jDPgBF5/x/PaxrvmvxBkQxfcXZvXXkPA6MQ+nmRNaScr
	55lwOvyKP3bPNAU8toiWN4dcXwjTvhih+MvvxEjcsRZrJzFqu02ID5NcC8gT9mTr
	7Ji5i56B3MoUiztSfEU1C72MfaYvoBsnsE/S3QDCCjNwASPTdh8sUk+fqS/W7oM8
	S1h7fg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhapmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:29:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f548d0872so13488426d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850177; x=1777454977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQuZX27ltGNuPMEcg8XYzIQnb+j1FapnyW44Bx4mBfE=;
        b=eAza46W3HOXgsBEM7r2mhjVn0wlzmWf1xXrwKbV1PNPuAuBYRr+tfBqc4IWc+GzmhE
         3PItQZugjUOrqlcWYbQvPLRy2I2sXil5pknDIo3JulyadIoZg4qYQzTBkgh49sg9rk7J
         zIZtbaSHUa6JjMgB6t6aP4dW4tqeNHvUj1JGwmP/1jDhpREiIao+mHmr9wNNprOwOAvp
         vS4t449h8ui1/CjjOX6HV+9yXnL7kQ8JAkZNrl+sgP7rDLZaCAj0TAvETs/lgZ6wATB2
         AOGdaJ/FrnBYQzygeJvxwNSk1ARiMw67dM5eXawEQQtTxoFwUaUn1saT+ICp+5lfqU55
         vuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850177; x=1777454977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQuZX27ltGNuPMEcg8XYzIQnb+j1FapnyW44Bx4mBfE=;
        b=af14iVbIgypOd5r0RASvBj8ZnJPluAYU5P+ONMFqqm8QDlMM03gi/fhDA7l3CaQ3aD
         kX5gxlTZiO0tkQWz+r+HfDBAHPK6EHXtWfEJOIRmZ+mxYxcHmTy5D/g7qXDm6//v5BoL
         cdvGVMrjC19WQR3/M/Y/OBrCVqhr3okiaxOJTf7PBweMlaGxzmPJMdLJNPV8kYSgcar3
         NuIwd+h4Jp6jPmkH9vUqVblSWyGgFCunjFaV3ZSeWcWSd5CWL1LlIVz15Yrt1zTxGGog
         MAfriWinv0sS7K3VOQhc9DvEWdegxPJEJXK4fLsV0WDZvQ15jKD4uw7SF1xB31Z7RQz+
         rfoA==
X-Gm-Message-State: AOJu0YybkWuU6wfXkQA/DPMRITG4CfZ95t19FALiPKOaNl9sT3VbVJPy
	olv0ojD8HxONApLKP36uXRRVy3s8tuW0SCxOcT8qpXb65W6fXpVXc+QIe89ANT5R4X+RAgx1gOh
	6HWTRJqsuxzOetclHvjkPUqoQ/eJ46XEBtbb2+2tF4IlDK0HmZkpLibmuf0qzF5b3IVpP
X-Gm-Gg: AeBDieucBcsUq6dpDsQ9UzsHch+vWoDe0adXzilnSpooRuhXu0Kqdp8dHmhUOu2l5pA
	GRNoFgezo/A/TBnglM6JJG+rQAhsM+1cfwzg+NE1BA2T/MLnMFTuIx4mLffyER3H8/JUKtiAaz9
	fmAmcqhshTQcr80MCeV9mAFMogOMIiDiM3+EPYwpvl2e2r0jybkyHuWpPKyCMhZ0rN8j8TFNi4v
	4vDXYGO5u5ft4MOoRYSFTEtFIph+/3vpMT6fiXUQJw6xW/jEm8fK6aq/XhGhqtnAiRN6RPL9VVv
	mIp2kITCW4ds9GX74HVvS/zePgBdC/El5iL8tTXbSrjfwfZQzpJYv/mcFjrwQ7KgfBcpOM3frnX
	2W6ZCv6orWIfMDQj1OTELo/IPb9E5s687NrFj6l4Pv7L5fXu0kJLe2ojss+QChJ3QdP+FSRhdK7
	uSyFDJ4hjkXNbhGg==
X-Received: by 2002:a05:6214:5082:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b028066d24mr239446756d6.1.1776850176841;
        Wed, 22 Apr 2026 02:29:36 -0700 (PDT)
X-Received: by 2002:a05:6214:5082:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b028066d24mr239446586d6.1.1776850176414;
        Wed, 22 Apr 2026 02:29:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm525033566b.49.2026.04.22.02.29.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:29:35 -0700 (PDT)
Message-ID: <1dabf57f-eb2a-4838-9ac3-9032da4c9623@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:29:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: eliza-mtp: Enable DSI
 display panel
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
 <20260421-dts-qcom-eliza-display-v2-2-67f8cf155331@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-2-67f8cf155331@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e89501 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WxTsWmAM6NDjCx9yuA4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4OSBTYWx0ZWRfXzvCINSR9+fIg
 loQyYsxlGYue3OYc5aCyFGmCxIxJkoVaoTLc9PiGnd8pPfTasOibNKM6nAQ7KzwXgEY9oI07Jzk
 FGEpVV5ghDfUWi4PvqTY51G6IIcIulvM7bSO46OG8UTX9tEbSA8uDXZhzDETPzP4HlVdqCgkbVk
 AkqTqIl50TM45rKS9vpcY/b+KPHdOB+zR6jRPgKkydZCiFJqpU+DN/c49rWuntXK/UpzPxGLBaj
 VYHzKNPNQkiEH/tLFaH2aqq/bHKavgx/VxHLyFjMi0U8nQPZAAScXgQmMRTaDs6OqpDjRnNbm1F
 HAcWyaekOnYW7nNY+ku4iNQKkpoxIv784n1A6KxUV35HXg0zMXS/tW3pVILefeTUKUyEqq4jBdG
 y5iDtRbfaM1d1xOd39/9YQijWoX5l4dLX0ABr2HxCuMdHpQnHaAZyWhTy78kk7o9qOgbPwT9A2m
 9j88g2+iTTE2raSX4AA==
X-Proofpoint-ORIG-GUID: Kj3nR67NttwOAwuaJNbFhQ5Q90TbZLD3
X-Proofpoint-GUID: Kj3nR67NttwOAwuaJNbFhQ5Q90TbZLD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104055-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCE5B443FAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 3:45 PM, Krzysztof Kozlowski wrote:
> Enable display on Eliza MTP board with Visionox VTDR6130 panel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

