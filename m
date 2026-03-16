Return-Path: <linux-arm-msm+bounces-97946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BwpKEv3t2nSXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:27:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15E299822
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA514303EC22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516973A1D2;
	Mon, 16 Mar 2026 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUCH5FHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UfINT1Qs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC162219A8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773663974; cv=none; b=Il1x4mThPFZ7FOs2gbXogt11XkCjhB0SET38W0aDIg3E2vgmjm6xBmSH/FX5s0MBPKPiuG9Qx0slJhOGLzK73rqiwlR8UzGs7I7Y3AlM/7ep1EGgIAFGUb3P9VtpNEU8pc+v3t16P6IhLE/J4rP9BavG6G2F71lJRfKIg/3PKms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773663974; c=relaxed/simple;
	bh=IirSsS/HVR9hUxtP5xwnNR6vf9Kb1Wca2Qk9WrO3Qhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uT07mcdesq76oS0MmNwBnkhMhh8v3fn+5LEmjOaXSNO1g/DNCjZuI7l5mJA54qgomQnX5dS++0YR1j5VDwibeQaW4H/D20QHsdSJ7KVkl4C4djYrE4nzzWbGl/Qhq1iRRyKY9tfvg4GyvimV+pYlBEuPd2YUcRUyNMbossDyOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUCH5FHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UfINT1Qs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBlQxd1282082
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rPt0QE6QYB/jens31z8BlEWyC4y2b9qck3Ypcgz6yo=; b=VUCH5FHZVvi8ZND9
	8Bk119GcDp8ZJSaugkMSiWPXnzsjP9C5ahn+XKZbXlFL0VPkc0RX8XEm/BehnCeE
	2XpZDx2ET+khA9Jj6t6hrPU1NU1Xa9UWRuRq+jOfJB9ksAzlMle17/4+IC2NLgnT
	o9zpMwvjLnO/09Kx6Mbo079O850sUpbMW/JPIZ+wIpMYhl021AmAvmNOwg/SqbA8
	FlWZOc7BizaezRD7Y8DV420VzRfDH+wa0igJ4rScPQabQ7S4Hw/xmgADpymT7x87
	mKKWEzhWZMteFnGsTp1bNu2k8yuSYMKl6EXlYCzN1tSKbj3TCD+y0OmY8zz9yC7n
	f/0s0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc5jar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:26:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a2c535eso252788485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773663971; x=1774268771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rPt0QE6QYB/jens31z8BlEWyC4y2b9qck3Ypcgz6yo=;
        b=UfINT1QsbL1qMQLDQD8CY+sjD2Uf/xugcctOGyujPk9Obps1Xz7mJIRZL1XJ2qi9Py
         GLElYjo51+9A5L4aJNAeVMqV5NztfERnxpz0lel4nepmyYAdIOOZtNIG4NZT7HJa+wnN
         YMnI4v5DEzLKiKocT5IpXGxsWxnR+PSgdH37OjzSnyZcyUwQA/Xo5G3wSNWSbjuatzIA
         KDVOh4DjgIYx10VTem0jHIAUWlv9bcBOcyx50HPLCixFDs9tlRCiIYwB3cPodrrTzCe6
         mgN8OqGgwIPZeznowVpENBzDhtc+Rghy+iHKtn97U2U84pShWCHci+Wld+TovwnmfuHA
         jwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773663971; x=1774268771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rPt0QE6QYB/jens31z8BlEWyC4y2b9qck3Ypcgz6yo=;
        b=CletNJOWcGfHXFfo1TetE4Yg/l7Tphxs642GH8xgAYr3Ycrxp37guwLd+oyeN//Bgv
         tfylIn2OtyY/Vdu01RNDt0K/98PDg6QzYrUjgbEMZ/CcmvS8AKNlW9dtiix7I3xd5oXs
         +fvOR8qWorMIXCLmtYk6fEInNbSPi++S/nnotAVjTxvACjXx1dfh406e61IdagrCUMSo
         /wBxMMUGl98yc2NJ+YUdxbvxUfiZGjSuelitI8TbDwCLDr4BJctI01gbxAq3zS9VUBB9
         fNMPi52gNoDq6shJwq1ThfXFO+bs/iWNK2yoLLd54OT8HfK5kzcl8zXGsUv5D3ac41Ks
         JEJg==
X-Gm-Message-State: AOJu0YxilQCsY7y5vWIGPryRbGUCE1wGJhQjOqtabVsI4z/U+aRjp/zd
	tCklYRcgop8kILDgAC/vHjtoYC44XjJydv2qtZN84XQbU80xp7xcQi9N2bRKgYUreX4W9Kxw5rw
	e+QmltZEtqojTxwCnVKjELi6nEC6cXCJqEkOziUnfg/5S+GGX+/oKy8nV0JQoDLoHEe4KY6tcAv
	QE
X-Gm-Gg: ATEYQzyaPqR2mFRdcuFcFmPzX2+3chU/eI6GR+xKiP8Ev35hmVTCHkIRjNvJxpzZSmg
	Bnx7Xl+eBv8TRDhozgqWH25rEQMglbFlCNzJEmAAUZKWzuX6ItC+lSniD4XP6oGhHQDiiAa2kle
	3ik+JniBuZLL8Z/QLu44KvdChkutpdmppnB/nLGrb93oDD7CuLS2tirfl/2airEBZClt//ZSAzQ
	RTlDJ/e4dzgh8v1eAskOIKqHsG5hv92a1IklA5JhtG2IBP4USSme+Y6e9Aq3Kh3bp/AMgZXTtwK
	7kMRUoYDrw+k38uCV2QqJijgqGyJBhxlIum+rvP8hQumWijir30I/5TsY217VoFM5ZLv3A7jzFN
	TxhtdoiDK4MGZucH6dGKfoY69gB6SYNaIL/cSQZGT7QLv0N220yZR4qARb+P6UGLTp78UYjtlmm
	+1D8E=
X-Received: by 2002:a05:620a:40d0:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cdb5b60335mr1331720485a.5.1773663970954;
        Mon, 16 Mar 2026 05:26:10 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:8cd:7fc0:ee15 with SMTP id af79cd13be357-8cdb5b60335mr1331717085a.5.1773663970475;
        Mon, 16 Mar 2026 05:26:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97850d59fcsm493366066b.36.2026.03.16.05.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:26:09 -0700 (PDT)
Message-ID: <a7534997-d923-4ac6-9104-75ea96db35a8@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add PM7550BA PMIC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260316-qcom-socinfo-add-pm8550ba-v1-1-d75fda3553df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-socinfo-add-pm8550ba-v1-1-d75fda3553df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7f6e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YMh9QM1ldAXx-teI2dy-FhHA566OYWCy
X-Proofpoint-ORIG-GUID: YMh9QM1ldAXx-teI2dy-FhHA566OYWCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5NSBTYWx0ZWRfXwTyA3BBCvlgT
 QCPSO0Pph4KTFbJmvTcZmqRF1b4obmccC2WEzCjYLo+s2cnxFTY0Fk2Sqh8Atuv4JztSA5paOdh
 Q7XyyXV/ksW9kYhxiPCygziehiqCvljbmIci0ByhZ8ir9zNwAYIrrSLHM+KXP6QR1l5Ksx4VDCB
 2tK9+Ts41axcR3RJmtKv7zq5pGu6e/F1OauFh6xA+xjJcXSIgW7aBnHnssN+MqKzj3s34QAdqBd
 WWOXZlQuccjW8/nRhEAap/geKbAZ47cL8/nwndpj8J1kUAdXwUiZsoa7bxr1BlvP4+XcK8eOaxs
 +sIdRDrOzlIxglqKSXEzBb4ZK2KvzYaw4wfBBe5CQLzDNMANYKL/VOQfdsykx66L4xrtL7yp45B
 3jp18322TISejZ1tlcKgGAtJ+1JNyawQ0n2GP2sbX2FPLFQ6LhPdk7enSQWm5pgIOOlTpulu1zF
 QxeEgu848O3oZIh+uzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-97946-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C15E299822
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 1:09 PM, Abel Vesa wrote:
> Add the PM7550 to the pmic_models array.
> It is one of the PMICs used by the Eliza MTP platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

