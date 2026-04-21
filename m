Return-Path: <linux-arm-msm+bounces-103899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMb9DBZB52no5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:19:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80024438BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 11:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35FB2302BDD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 09:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A6B3A2579;
	Tue, 21 Apr 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqxyvcKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7vTy7Ho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A15282F39
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762858; cv=none; b=nhfAnH7flrojDqp8mSSWueVh7A44sQU/w9ai4D0+salyZbrs3Raei1uEl+PnpVHglR9Mfm9aPUdxEQOEcua9xZY+K8Rsrv362hjJh9M+Q05PX9lFELmDOVvAZtsnl+CXentlkAXGxpC5Xnzw/ikKY5KGJIgCEobjzN9w5LMA6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762858; c=relaxed/simple;
	bh=c2RbYcy+iFlDl5AFfa2xTzWrlBsn2+9E63+1Jd4Fxzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJsIQkuUuv0dnD4uBPfsbSVUGUVZ18ISZJzif4FsCXyncOs7IBbX6zsu01undPIHkrKrhspyfdasXujhUQcgH1koJlrJPn75uKNo1VJy90ph98CoDSByATSvHgjdllne+a62fgw1pzijQlsW6x7lznl14uzVunrP3Qa3RzL/FiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqxyvcKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7vTy7Ho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L30SfL046047
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GypfJ8XGBKC4oouCH61ngZdwxT5uRzGs1MoGPINQRI=; b=iqxyvcKQXqzx3s+p
	isFMG8LLzkrLwEBXUXzJs6T5c/yxBOzup3/CdgC8Xu93oejm7P5N8APh1fTtjNku
	CP5F2m4fLD5e/ELMR95SjYTiu6Bra2c3J2xU2WNjDbN5exSGiPLh48EMDMBcvLIY
	XxOwvMzgth75so9FRHqabD/8+6VT7UuTTbiOplYAfSf1XiqYTmmt1IbPArY8hwjB
	8iIk8RC0s1KEX8SRDKDXnjxqUDixdOB9PVmhnDl6D14ozN7FeYkBcd/+GtF2YOsp
	lbwoQ6ZYiBZ3p3VuYvlF+exsGjpVb23Xu9yzAnSfVCIsDAkzF7wv7LNABNVO76rt
	8Ew0NA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1s9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 09:14:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so2797802a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 02:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776762856; x=1777367656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GypfJ8XGBKC4oouCH61ngZdwxT5uRzGs1MoGPINQRI=;
        b=Q7vTy7HoQ9ZMRNFdRDOqJFhxUjgGmAUuqbCbhO0WSGIjI5bA7H/VrGvm9xMAenGAgv
         xD1HIlzmZINHpDzrtyxmguQiTmz7ezEMf3ybdH5t4ghZUxfL2bRskWJbpwQwI3+e31re
         3DTRhC4jtB9qF1WcQjTwA9eNYsSa5+bLBSFZJUE4jgGL/KD97bk09jxI7AIQCU2eBQGR
         hC0jCNVAtO+FmFKDxEvbeM+j62VhBYJDQf+8BybhtvHtDUtpUvuD78PrdeMe/8eonwn3
         gXgOb1WAETPnIEWDSPKiv/rqsIkv4I2uv5rlTjNv1oAT/7dNcAdt86mLzTGXGr0vgw+s
         O2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762856; x=1777367656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GypfJ8XGBKC4oouCH61ngZdwxT5uRzGs1MoGPINQRI=;
        b=IqAc8J0CTSEq9Hds/uBekNOz/31oNNwDudpDqUHMUUkYUZsLRHy4Pl4UU9s7gcZAF9
         FHxOUh71UvVBCcRh98e0B0mrbGlj/4gh123DnHw16QiI7RF7teDb/sA/6w9rqFxJ95O2
         NPJJieRA1it/9OGmX8tVOpX9dRvd+YmakiW8cMAUeG6jMLtDwTqfTIbI9W0bgiU+gffe
         lm/dxjFJ1M855oStLxkLxnBl+Eo8fNu9VaQR5Gn7UhJ/+0J5Yuj/h9DYJws6YA3rj8Ci
         KUEQZwjgGovCGNzobruov8R6YHIPE0ZkSdC9DzTrKaHM5lvfR+p49xNn9rep4okxk3H2
         DA1w==
X-Forwarded-Encrypted: i=1; AFNElJ9XgMIcG8KJEnvFVa02DaHHiDz8A1LGk5SHZ67RLeYuuIshVgJ7q8uOZ171+w0xcgdHLEQ8Jnvad5lhkIlu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ARGjw/ZU7W01Zt/5lelPsqCcMi0pKMVkcp1XCNLjUZUZn9FX
	iQAhYqv1TrB2Bj7ilYrj263EewlDf2yYbjUm2SxvsOiGidFlx+GNRQBaZdf5Im9T75BMJyZ+qtF
	yYYoGhqJUOFFKlqLiwEyy66zeX9gwSctF2TGc98S6DfVBIZZU6lYSREP+hgGcZ2b/R+xQ
X-Gm-Gg: AeBDietnDRzkxEGYFMRp+HVKYOYO8Obbu8B64Qagr/0waFp0tDYU/AfSPe5R2RipKAv
	BRQ2OgXH+JUpdr9m0EjaWJXscXEmztAUJ4zDEjOpMBqf9aN6mTBC9VGhZmyyPRxlg8ITuaAFkGn
	eTCbrditT6lDCmrAXZ4lZ2G+7Owv7Y47+VB0xfVeyWSqjNlu8MgT26VTJUpesfHDHQLb2xYV3hl
	pXiacJqdWU8NXOSJqiV7iLvUdKAvA88NH+CR/AXl942DecSOu2rz9qpssNmrLHRQmZ/A2WH1jNw
	bWb3RSFmSHIjoXwrwR+VMTJ0Nq7LnT3eXU3PJgIFPSSXbnyH5A8VWwn6Ad5cTQeUtyzoEeWsddp
	NFW08dOjvhHKthG5uUt6frkcffOD6vOiH7Q5GMfKg6vk6/ozKwW+RWo53sCw2BLcy0mI=
X-Received: by 2002:a05:6a20:12cf:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3a08d93976bmr18960832637.50.1776762856234;
        Tue, 21 Apr 2026 02:14:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:12cf:b0:398:ac0d:9a0b with SMTP id adf61e73a8af0-3a08d93976bmr18960794637.50.1776762855798;
        Tue, 21 Apr 2026 02:14:15 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976fa40b2sm9292596a12.13.2026.04.21.02.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:14:15 -0700 (PDT)
Message-ID: <f8d43a33-3b43-43af-8ada-9fbdac2df7cc@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 14:44:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/13] i2c: qcom-geni: Isolate serial engine setup
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-10-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260227061544.1785978-10-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e73fe8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3uQcbjdxft5aBLpoArUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA4OSBTYWx0ZWRfXzm9MUxT0WYNT
 z12ta8r4aDazbq5+o+/71iHd+K7h+n41BX5oPyTcbPrsxqnkXDH54FTJJ+W4hrsL1/cDnfKjVAm
 zMSUb7oYAxyp5zSqXNUrsDdZNAYZU0vB4HIawn4IpQxGQY2GmU54vnxYdrQSDwgIqB4N88K/weU
 iad/8Ah/nJrTU36AjSm6l+2iF6nUQX285QhpuW0EnUOfU9qsdHIR/3wuFJQnBb9BWOM+XeLWNwM
 xLd5FEOXrjAD96GMds9XHcWgGbPfyQeiKUdeMIPtU7xDuTs4MZ4jqHjE20lVUtg0/DCZMMawtZt
 xVuKHrn+ML7/jYHFM5MLykwtjJi5KanP9Fjin4Yg0EQ338BbaKZZZqx5ZUhYEWVWMtcV5poMGlW
 ziLdKWxXFScn8jEbGNdpBxdYA4EmCJFd+KXaE3UDlvRnJ19rmSDQ9eTuvDV6yOG9y07w4//MpNF
 XmzMZ+G62AUXMNFfeqA==
X-Proofpoint-ORIG-GUID: ADVXGvobl2VA_gEwW6vlGh8_HV3KrnbD
X-Proofpoint-GUID: ADVXGvobl2VA_gEwW6vlGh8_HV3KrnbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-103899-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 80024438BB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/27/2026 11:45 AM, Praveen Talari wrote:
> Moving the serial engine setup to geni_i2c_init() API for a cleaner
> probe function and utilizes the PM runtime API to control resources
> instead of direct clock-related APIs for better resource management.
> 
> Enables reusability of the serial engine initialization like
> hibernation and deep sleep features where hardware context is lost.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>


