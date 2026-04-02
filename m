Return-Path: <linux-arm-msm+bounces-101422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CBYAnP7zWlYkAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:15:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F9383E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 07:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8DFE13014292
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 05:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4B636DA13;
	Thu,  2 Apr 2026 05:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmgYwwz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRs7+HrL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE43361DA0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 05:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775106897; cv=none; b=SuHcVwYEqcZxyCET/tpsWu8Pmx2mEuqtEZiK9GqSH4ynSH3yLP2zfP7BDhNqzzOo0+MkX2QSCXuP1RH7m0ExrYB5Qt4aO5hkZwv60tEdoMoitiO9CSYs9CyXi0VGB0Wtk5wDHH02OJ47fUo6FnCi2kVEGJ55CM++2LyIPxGMvTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775106897; c=relaxed/simple;
	bh=qvmIaMpB8VKwjCEWkXXEWkEa3PbVVnanfkVCOOFvpQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfegnhGlLJR1UD8OHo1iOSQlNxpU017CMu8Zf7dhDD8wzDxpwoSbgmgO4E0ngti/Uw+zYbT1nsObDeC/aPpASSDAjBKPY+/stE9KZSZoTJSdJHA203wYzCn2UiY+ZnSzCB9dhm94Nm6iqlMoeVvAJq2Q8fG+PjjLTvwGD+GZO+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmgYwwz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRs7+HrL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4ud92800070
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 05:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvLStu+nWIcIMPClCIFCdAtOii/H53hgE/Tykh3nb08=; b=WmgYwwz2QrscpI1L
	V/hbTeiRaQIVStwnZe+gIE136lL8FxI96oeb3HAlPHoS1IScmcEcQ7tZDbtfmIjO
	wnN1CJa+Kgzt/XyT4d4TCBVvittz/6YJ8ONpUgn18Pe4C9QjNMwGXiwRZ9hB0xO5
	Jfo13nUEAVwzxj4wZorbO59TH2EWfbgepniyEvJD6AA9lyC4PrcKJBcd20Nvpnc9
	n40W0c3Txj9/aXbTI9y2av+z9v9DLZ62X9tJgOxH+Y9QmPp7dRq1VS/HX7RN+Ur+
	Z9CjnyQEyK6YaquByQMVB/RczjuUZMEGm8Yp1QTlNvuSE8u62f0wMbInYfr7iHNa
	wc1kWw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk2b63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 05:14:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0b0aae381so5651065ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 22:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775106893; x=1775711693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XvLStu+nWIcIMPClCIFCdAtOii/H53hgE/Tykh3nb08=;
        b=NRs7+HrLV+8yWKr8wykK9ccynzu1iSWh56pp9MOQHIdbqe3Auss7oYakQmU/yWQ8WV
         IBBDXAnl7ShnaKRofm+pc5OqUgMyM/I33DJnQFSmzaQwEVCmyKTQ38/npcTKf7v4bvhE
         ta1XsHmjmncd65YMVZVNVYWtq5Bu+vMQoQ0FK78oK3nVz5c8/VgplfTAyzMRHLtYdk/h
         yGS1AvN3IO9aWpkFSVWl27gAg+z/6Fveghs6U+XYlKNJ5sga0F1ZDY0t2KqmaUmPh0zV
         nXB99X1S0wb44ldpCU6IpJ0ZQhRYfk5tFnVcP5FqnWWiMBkeszwak2frXqVb3GSG7cnL
         ykKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775106893; x=1775711693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvLStu+nWIcIMPClCIFCdAtOii/H53hgE/Tykh3nb08=;
        b=QmlaR8pgmzXLoBQYhrpRb0slHfoRhuCfGlQIMTSmbtV/0v1q6tlJNOMCbZv7LSZq6Q
         LJ5V7PkXihL4aEoSCZK8QD3T9lwa44YvGl9OhAVGhhabSL6EC9klxQ8pNw5BPZPvl+sc
         F7ZbRVKd7bWcdkQJc5lTHjzitQ6PlDCSR3FNXATIcTNe8++pceaPUq9btmsh4fJmI6U4
         V9hHFeUcPXWFu5X6InyF9xDrWaSpmsiU4iivuI//7wHWvYaVK/bxU6HAe9pmhgiS8f3C
         J3h+MlR8jpQaV3MTzR3Ar3M46VbcE5RPSIz9lwU45X4esQLLnfduIHjoivNhdDgwo5/S
         YVqA==
X-Forwarded-Encrypted: i=1; AJvYcCWa3N9DO+6EZuaJePbmSL+I1qUL2SBxwMQV3DlloQVtIcFXbEbw40qkA26Tqo4CaZLEkvr8zGtql2Ya60QU@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHV4ueDqaUUAg6eLjGImdHKb0OWhG4boh2acFo3K4kfHLcp2R
	ChQLRN8a1JBiB7Ix71UK02kaSOqmbcmhTkZr+bjcXa5kyEJFlpFv6HN1ssdz51DVvGjsVbdyhqH
	pBjXucRri/CRjsZu37haWBUNmLh9Xj2F70zMa+OJ1PLeESDQPlCdgQsEsHEikKdvQgH7Y
X-Gm-Gg: AeBDietxxk1CbhErsSQL4DCTq956/kCruNbxROIRGPQZp1ma8XBMJ+7AEac9uwBySgZ
	UXtsOswlbWLZbOCTPQA5T6KLrnMalotK7CDhavTmy6aJwJKVZxl4FZb1KUJVQP7e9uaWsRMi2HO
	eqXIp0CdI2osoncOrfMSFoOinjLLQ8Z7Iq/s7Yi9+dg9ShvApizxotx9je6T7tTOkWlNSEnla+y
	gJNg7IiwwbO95aAJsxCnc8ik5HUCjg63tikySDtgJCcGWk2LVRauU0LzW4HYZfFPR8hHyGNI4x4
	sis9ev2toGhdhJj9IjwToiTdR7TxbpbjWfbFUz1gu1n/gHS1rUqbV3BXjkc8IgiaV4olj2IQPP6
	+WkXVxQ17s/SLR/JiIWxY/jUaK4elh7O5FFxGp9pf2m8Aufgrq21d
X-Received: by 2002:a17:902:ebc1:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b269a96018mr57018415ad.6.1775106893220;
        Wed, 01 Apr 2026 22:14:53 -0700 (PDT)
X-Received: by 2002:a17:902:ebc1:b0:2b0:a957:304 with SMTP id d9443c01a7336-2b269a96018mr57018165ad.6.1775106892693;
        Wed, 01 Apr 2026 22:14:52 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cada2sm13740325ad.71.2026.04.01.22.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 22:14:52 -0700 (PDT)
Message-ID: <9b23d1c5-7901-4437-bc53-91eb5ad4a8f9@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 10:44:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
References: <20260310113557.348502-1-neeraj.soni@oss.qualcomm.com>
 <20260310113557.348502-2-neeraj.soni@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260310113557.348502-2-neeraj.soni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA0MyBTYWx0ZWRfXyhQ/JzHUfAaP
 Ci/nBF1UArlokpdSVpEpkXqoAt6/X6pmNOA9A6vUBPkx/s8ao6Y7V9lcoM7SJIsH5AFnHsGtWxo
 dJ7KlDZgKgnA/fN5NTRgQnNiWc5/7jApcPSFtikW4N8FCYD3XV76N0tePF7Td0fv3wm0KeBIuxq
 TmxYgK94vwFuaLTMj3XCk6ahPbPD4l0Wl8EK5W+PjO7OB2aw0xKiwIPc/PAFNToECgQS9MdZH+Q
 131qaqKyUtQsfvwlUvX2fAjB5s0u/4FNMTpgOga1U9m/Wb8JcL0TeluHCV/KEu9Kjnmwcu+nkAA
 GJ4qa5qUQgfVi8hSwTsbcmDTzlxJBFvSjte4E5RudrAuB+PwfE8hMfbYDTgCzDI9DcOsl4OhX49
 AX2Fh5U1tLBLjLVcXATsL5TTbc9Ei3J3kD6tm1an319kqtLWoX8B5x4x2gr+HJCYgMPBZMRhxLx
 rx8b4kZnp/dFnTcYw/Q==
X-Proofpoint-GUID: 8WkRq92Z0DzUfgDDw6mMoXhW4KiJckZu
X-Proofpoint-ORIG-GUID: 8WkRq92Z0DzUfgDDw6mMoXhW4KiJckZu
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69cdfb4e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Y_tMwQXriIPcdNmw6HsA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020043
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101422-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 095F9383E4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/10/2026 5:05 PM, Neeraj Soni wrote:
> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
> So add the qcom,ice property to reference it.
> 
> To avoid double-modeling, when qcom,ice is present, disallow an embedded
> ICE register region in the SDHCI node. Older SoCs without ICE remain
> valid as no additional requirement is imposed.
> 
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


