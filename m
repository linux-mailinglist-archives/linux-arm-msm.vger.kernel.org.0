Return-Path: <linux-arm-msm+bounces-108442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hy7Db9ADGqqawUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:51:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E457CDC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81A30300FB36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1343233940;
	Tue, 19 May 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3hkma2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRf7R8kh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC923394B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186648; cv=none; b=p+yhcOb3djZcisOk4QW/kbt1uB3dt2a60IZT0+x7farQiXwL4ToT6MH5w+u4Hrc+ofN8eeljW/ZFwy6uCc1+bWNZHt798OX3mx+QrArFIHemA7sgYKGVHajWF+xEDLKpTwsUbJbFG56mWs9yj3DFq1AELf59V+8JAGBXAWWjeTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186648; c=relaxed/simple;
	bh=DrHYf7tqRQlk8+UMJlzpuLDOe7qhskYNuKQLTOdIGBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G0BUQgwdecUwT8pGgMdoExqbyPCxB1yPtGUINp02fdUoHiZPs2OO5+y2yolGu3f7Zx4vry28MqmOf1dzPe/FMEB3PN9TGsSHAKTGoQeCoIGrF6GLk91ZT7ikxb6017qtNHmvKsm6FJWetQFLSW+vl+T3eq4q1Q49vtuinyR0jao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3hkma2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRf7R8kh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WTUx4131492
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=; b=H3hkma2xRjIZtP16
	Csj0mBKxkVcPv6DtcNTKqaocgLwHueHcZ96igOx89nPEZTLo0fJ9INS1V7Mh79NV
	7AznsPqHleu7XeWJ8Y/4/g/hChEJ+LzyGOh1awoLzGuoTd1mm1um8VeVdKE/N5/S
	TNmcGp+HDNqGIstPoRY/aytFmoISjPIdhL6OtXHD2Pl68kYsmbthYWkanjP+G5WQ
	XX3YowAoooZcD+B2uFDBLf+uh35EUhmBCDSg3/JP7OrKujAMbBZmxeuOiR+XNspR
	o2zLdjY9Pn8Rf0iJCStGLm2OtM+pelnu06oBkVpSvVh9nvBIDvT2W6PnhVgz8Yos
	tSWmpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1h8us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:30:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so11519291cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779186646; x=1779791446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=;
        b=QRf7R8kh4UfOXU6hwx2PDuoZmsbrh/VMPfB2xiswLNfvIp6GMAboBE4na/6a5vdtTg
         ThxUB3gB8J/22q9GmhECjxaYkpPr6yK/3cQwdRjy8BXHrl7Pe2AH+1UMBfXeapCIDsYQ
         7v9Y+UPVYaFW9cMfhr7TP8ti+AqtW51dkImv2UjmDAsoV+46hK2AX1FJbVNsEuNQrXIN
         6V6uMHG7h8fEXlHUbFxsmlrHJhiRINFtNEuxyoMmy18l0L27SVbsYHbOoBDdQW3kz26b
         frBid7ZwrZkN9/yvzPoHhWbnIZ28JGOxvZBSfCODbMAcYaOHcq7yRtV/fF1VnISzN9n1
         NEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779186646; x=1779791446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNNb3VR0RTAlc7kc9jSJqHqxgcj5jehGaItIcUWnHNk=;
        b=bT5UNLK/YVMryGWkFHyPvoyFY/9w9JczBF77FbW6RnBlfPwk5s5wyobXepX0vaLSzP
         tl3m4zMLTYOu0ilRzOKegJA0LP1e2npjToc7dDEdGgofhKuyqd3lvLo/vHdjk+Dpsbke
         sATJBc7JLwO9Ce0o4Q1RYYyhpxVNWnc4cJD9VqWMF39Qdtji40kP8DAfU8KYe/pqZsee
         Y+6mA0ALGqS+QtHoDcO+Pb7lU9Zd4qxvKXGafV9gEb5ujbMONMSkbDR5rfvirrjR3E+n
         pEzO1fhIRtZ0asBMT6Q0PuHuAQjXUBwnSOkga0ZEAzQNDYJFgXKelXYjlKkIdIKJH18K
         o6WA==
X-Forwarded-Encrypted: i=1; AFNElJ/FYm2fHN8o6zm6KtPGPXnubJunHrBMBiiHgUOyVBkN5F4X2R3abji/K1WLDIAn2QuXcpeO1O9L5uKrbKDm@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGYrPkNZLlKtTL8n4NSgDm8LBSmWt3d0tJp2NWy+XKxkKZlOZ
	SCfs+lDsjd4PTo5ncAbasVFGQ/tKWwvDikCC2VcTt2vvbvgL//+dVcicDCn6hrNbUzS3y6aQptW
	8EHsXXftL4+LuuqyTXAEfHFuDhxvLio/qY31FElMvWuIvXw7I0GHrAyAl5R3TOntcKzoK
X-Gm-Gg: Acq92OGQ+b3uxyPBq7DV6CORhkJ4jx17gCymB1HiNoSCkgMSsNFYXniz+xyQNJE8WwM
	6+zR36PXyFvhW0zsg1fYdgOZlwjDuu7GPbWA6+85gah0i+CzXGz82im8T7T4m61bL/j8FM0SUJj
	Jy5QJ0/gGSbdg/MNnme5YLuSlECQvVZLriAInlDLSxmM4P+2V/4K/PFFJt61wlnmHuo5oEk8/J0
	BnJC1iDLbXA4glJsL8iJIAR4Nvu7tRpHmmS7rdQuiZVE+fCNc4g8FBZOFMl/qAxhHGAdECP34FU
	Qrgj8knB0XcXQ56EZNlvQTP40sHNnCQxPTUAedUF5gBPx2Hj21etWjgQ/QxQaYBSuA3qWCP3rFN
	86S9NunioS6rdORyglx/sN2JAmU+rGiDRBA4JQ/VRoZxRogFFAMHLKTss8Bk8Sq4yGY1Q8KClcU
	YqvLc=
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr174859141cf.8.1779186645634;
        Tue, 19 May 2026 03:30:45 -0700 (PDT)
X-Received: by 2002:ac8:7dc4:0:b0:510:144a:636 with SMTP id d75a77b69052e-5165a22eb4emr174858921cf.8.1779186645103;
        Tue, 19 May 2026 03:30:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c24178sm692805766b.15.2026.05.19.03.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:30:44 -0700 (PDT)
Message-ID: <6773be1f-d48a-433d-927d-f2a90e56e82b@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:30:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: Drop redundant
 port
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c3bd6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nMIgit4TKir8xPiZD48A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Y0L_VMMuK0trzyD3y7cjt7RJzTmkmf8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwMyBTYWx0ZWRfX5z5eF0GGL01s
 GPTTLYUaiOSVQ3AuVVjYDBdgVT8+EsALRgDsGUT36fUIHJVZShOdeuYIcmi6IXuBsRfMbvRbNjd
 Vdb899f9xL3ZmACbSUYHcPeY9Pjf3a7O3AXDjuydlZpGOkD91A0xCefMmETbvNgk3HwKOlVlzR8
 dLG/L/V3kb/IPFMubw1qG1LPAKfMlBpvKyIxBiKQUw2CznHq5LGXE1CxLpNQ82lYFHmjYbqfLvm
 ULm6OrVNjHcXfLZT1ZQDeulGMXWHvaIFdQaItr2AN+k03tjTRIqAkMNhMO8NabwoYXadFom8zQU
 Ww2LPYPzMVynEPGKxjzHcuUIe8JeUz0kQA9VrchvkQNA92dMW2TxtOWXsPkKdHspDJpdEvnWGIk
 TT9/5b7ZTzKfWVNHhMqm8oZwEPz12QTfVKmxhfzrQaEp1ar+kvDXhvXaFezGl4SSp7PVa9JObsT
 gvTF5mRr/lpDsyoSYKg==
X-Proofpoint-ORIG-GUID: Y0L_VMMuK0trzyD3y7cjt7RJzTmkmf8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108442-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 700E457CDC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:00 PM, Krzysztof Kozlowski wrote:
> The binding defines both "port" and "connector" properties, where the
> "port" is claimed to be for "data-role switching messages".  There is no
> such dedicated data port for this device and role switching is part of
> connector ports - the port going to the USB controller.
> 
> The driver does not use the "port" property and there is no upstream DTS
> which would have it.  It looks like it's left-over of early versions of
> this patchset and is completely redundant now, so let's drop it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

