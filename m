Return-Path: <linux-arm-msm+bounces-99830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WH3zNkTCw2kOuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:08:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2A323940
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77FF431324E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0993C73F6;
	Wed, 25 Mar 2026 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwziOe1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AcNR3kLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450413C9EC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436394; cv=none; b=gjmlEQ2/SChl/mpReCR+Opa5FmhKc/fW2cLQbJo4xuF5t32koeLdV7vW5pn1olPJ53hBnVZXKsIL/TgOceSnB/ikUCpYHoFE9FZAPMyPlQgtt45jzFopHR+uzJZJz2gB0mezKk6P/YnbEdFGTEjsfAYcQ2ef/EbDRYzLyJv9/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436394; c=relaxed/simple;
	bh=MkmE8+ZDOUmHYBEfrZwhG9doqVGA88AKIfvh4C6SG4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6Pld00UXh6q7skyfmI0sILVGH63algVQXKBZIGVBc/4EHHyVuEki4ua6simyq0cysxNBBFAEo3syfbFZ+SVJ3fH2zT+z3FIB8MGGI2O3RwvKUbUCne8NjPxAbq/S497mW8zgnI5ACDKRMNDhHSIHsl0N99qYMRpChk/+swDSWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwziOe1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AcNR3kLf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PA4ISj919638
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KwEC3ByRvjcZzVS2lgRRDZdbI6Zzlr4b3rtuqfUmsRI=; b=SwziOe1I80qb4Dbj
	eYySJ5C2OU7NV0z6l4Z+3kWsOjP94uLVSX9RUc0DLpYlYUdlkkBpxteEoff1md3q
	swVkr3MuMKgt1iiWkFme2/LW09nxTPxpQQvA/92g1TCVCyiLQpzi5uUC0fRfQmlS
	2ABgZSBHxO/Ki6JrQ4SND1EPcgqmHP5moC5BtgfbEk4DhHwgZP5i0uYfCmXQ72uy
	TpuGsY15P6OGpPGBz8SYJxrZZnyLOdmmRCYyOW8VzKzlw4uftkGd+v/Xam6cLcFL
	qT6cPQzZyrajnapLrlH74h/ygFSbCP0bf9pvj0RMtis6ffCT18OeQ9HNLxS0r4rR
	2GjFRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhfe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:59:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35ba39f7b48so3689531a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436389; x=1775041189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwEC3ByRvjcZzVS2lgRRDZdbI6Zzlr4b3rtuqfUmsRI=;
        b=AcNR3kLfO2BmHWfDQMGStA5hJRcsQsA1vda82Qptec41fTD7Y6wyMZYKGworYLC8hR
         La8xryrJ/9O50hdRG+n9tW/yDPR007mYgWqDnAK/Pmo3wzv+1ZdAhryJ3Sxwzi4gNMEB
         UUFNAV8kvGx9v4BUeFHnJKjm4G7+XYUo4Cml+dI6Sr75Z3ahJ4xJRmJmqzEu0e68vAP6
         4sZOgEzDT4ZHJqeGUG5wsuSN95PeL3oFxAPpipgzMataH9nbOD7GYDu6WDuXzTMGHI2+
         LuzvexogxVGTE99LmqIOaOSKsXZZU2QeCBRBmKZFLIeV+lf1PQHz/Ltg4gEbV1Eahism
         6c1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436389; x=1775041189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwEC3ByRvjcZzVS2lgRRDZdbI6Zzlr4b3rtuqfUmsRI=;
        b=oa5+kASrbCQcyyF1nBXExYzsPBwKiocnK80hMRtfkdOOnJL3hELAAaTkffhmwU5KNK
         oApMJY0U+Ldtt+njYTxFc3NyvfKnve3R1hmn9Ap5hsRVRckEUGf4lmtBQCD+d4X5jc8M
         EQ1L4HW/6zj5XTWy4qBgMkyZi34R/EHCsvUReB8Nk+D1UFqdrkCpjUwjM5pIh83bUZyQ
         nucsk+Y3WyjrNSbHeIP2n7Uo0LmmDVx4lx1H13LcAoMnQEmr0N1c8eDLN/ioXnw1tKgy
         xLmsoeXnSUkTXE1RsMA1W7Am0ac7oO/AkwfGdFWrTvoK5m+5KNlKXPX+BXHM+jWcXvb4
         lw2A==
X-Forwarded-Encrypted: i=1; AJvYcCVhNMhzSLjhiqOWMcpo7pANbmQkIwJdUJsb0YOMa94wLZFFLywAuSx99jMR0fAbog684xS3wpfSS3z61Rnb@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ7lnAvh45A5vBbRirEhsGgLJRSJpT/0yLmmtw40ns1iilh8U8
	Gfkz1SnV9MyBF8aNVKCRpzVSEbDgIMnUDB8fXgells4brgJ2NCG03aOWy6/D9y/kSb66UT5dxQ7
	qmVA3Ij6EjWRch7gJX0F+W6yyhghgfu+tlPXg+bKqL0ckf9OquA4TVQ1rHc3EWEArOxVP
X-Gm-Gg: ATEYQzz4+7v1ouzb71nWjolENy5CIL8EIkd1EDFtsydx4iWveZH+o07okXQLSgPicUQ
	daLABhXh9tAdURjzuYi/gsTolaXVnxf7g3EUWJfCOuqV/BHzl/sg45JRtcVVnYmhY1igd1FtMAy
	foE3l2bPhmjbdtY0of/RW5vfcLHd3Egym1MI1NNhpaIdxw6GijvDgnfVpkp4jxVy4Y0gE2AyWHJ
	gHrXecYZ59RsE7Ey8t/1ceA6gb7K852yRwDm5SER5gRF2pzwSlC08c64q6kHzZk9j0jqvhviN+b
	9PAbkswud4tkshx3X9tyB+GRgpwEKgxnxbeBd0iWdn3GhZpiTblTSV0d4Dbylc2fy/+zMMFlpHa
	hje1ZMswfbbgqQyWWIn2oGVASpktqZlMPwddiPV+aZ22uCiwDJmpCtulqBXY2zAVKnoOtUjf776
	JFKw5Sterg7iI=
X-Received: by 2002:a17:90b:4c4f:b0:35b:a2de:852a with SMTP id 98e67ed59e1d1-35c0dbb79eamr1769812a91.0.1774436389483;
        Wed, 25 Mar 2026 03:59:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4f:b0:35b:a2de:852a with SMTP id 98e67ed59e1d1-35c0dbb79eamr1769796a91.0.1774436388985;
        Wed, 25 Mar 2026 03:59:48 -0700 (PDT)
Received: from [10.133.33.49] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0312ee89sm6905687a91.1.2026.03.25.03.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:59:48 -0700 (PDT)
Message-ID: <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 18:59:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and
 Wifi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NyBTYWx0ZWRfX8N3QZ9RnJ/2u
 dtGLANmimJ7KyT7e1uEShStR/JYXsyR6Gp7m1BGhGlBtVp17lfESL85ICzRvIWp0T2veZkDot1T
 GdfT0CKp/sAlNrdjLozpeS48n3st2NoeEZBopxu/iTExIO+ZFzLohk1ILQXDoCgCxlbgEmwFidg
 5kx69MC+boroktCsxfLFOVjXIWJc2RMuuGocaui6oQZ6khiUj7dT+hwtHBP1WMMh6YqMFyyw2ky
 pl4cHdvhJf5TyKqnD4tiBWl/pC82pYgwcKT5To2lJtubTsHkIQkmhUXWZASwo//WGM6p51JlH0A
 huQSBx00DTUMHHwhNuiM9u9RJ4ZCNx60R8JofSIEc0dl8KsiyaGeG17ga3Oil7y0cHAOsTNRa+f
 xUxjRtaAgPjg4MqIeWfazZwwcpYtuSFDiSsVboQmkP0YuxUxUhx9fIzBf92T5JCnFL7/ltbnDb1
 c/vh+ONroeZSGi/i4oQ==
X-Proofpoint-GUID: tGCDGHcdf-ltE_X0L6sKij7_bdV0mVvi
X-Proofpoint-ORIG-GUID: tGCDGHcdf-ltE_X0L6sKij7_bdV0mVvi
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3c026 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ipo3FooVQioUNJtqZscA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99830-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56A2A323940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
>> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
>>>> +
>>>> +	wcn7850-pmu {
>>>> +		compatible = "qcom,wcn7850-pmu";
>>>> +
>>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
>>>> +		pinctrl-names = "default";
>>>> +
>>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
>>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
>>> swctrl-gpios?
>>
>> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
>> the input pin is not used by power sequencing driver.
>> just give it some default configurations here.
> 
> Please don't mix hardware description and the driver. If the pin is
> wired, let's describe it in DT.
> 

give comments about that pin in this dts file ?
or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?


