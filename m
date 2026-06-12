Return-Path: <linux-arm-msm+bounces-112948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id STWLDEUPLGpqKgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:53:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD915679FB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:53:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QkYtDQQw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="K/M5Br+P";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112948-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112948-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC680305E45E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 13:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC08F345752;
	Fri, 12 Jun 2026 13:53:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168731F99F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:53:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272384; cv=none; b=o0s5+rqFgHDHuiVIVgBlM5ccb/fHH1/7cfTx0dj/lINnlXv/Pq+tNd4dKEP7n9UzMeDenOiiTnYMt0FSxzDcJuSFuidUMpi9YhcxnWbsiytxOxyFuXx6lQh52PX07thObYLBXMN5A201jw3Adx/ZlcwC70R+9YTPzAEaEZiKC7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272384; c=relaxed/simple;
	bh=rXCM27CI+q3bTwAWRJkzblUZ2cY/BDik2t113jUneK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsuSQUBQ0OHBjSR85OK+T1GmQwMb9p7xYQ9qhw84uoTt5Y6x1dIBrbv+OoFCJtc9X2+rQpXA9jID3LKtD2uckkUGt7ynYZiaakpItpyj9WplpmRYAIGgA4iYTa+Qm1iHrFTxeG2FIhNY619+zdFZ6pGIzD6qDNbf9aFdvBhrmog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkYtDQQw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/M5Br+P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj7Rw2160957
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTnfVI4gotUQ2bkxP6pmXcdIqm6lxSQhArEpxlHE3ZI=; b=QkYtDQQw/ZsdVWqT
	HYHVx7VdGUQKUBiI6+HBXseYRkL7tJXUPoHCYhGUDJC6RFYsokkh8F+TCMzNYSN1
	kXFu58eDSMCL6mILiFp1jQ2+hzZ0fP2Jh3H0Tl/QDoeDpjvC0ZM7ewPlF7P429Fp
	G7t2Z+lyDbJHPLf12tH42slt2ijXFFuc/mEkB3G9FhnSzKOjx/yWNijTvqxbRr9Z
	sEOtP7Jtwa6Ot9LJMpqhGARPg/6kkloYY/ODKRKtJ+Q0cka2hvTiNPWdcYmwcnrp
	Dac9R8Pju8OL2nMyyK0A15fX6y1pRMMjpqY0mBHmP/IMZ27LnI6S+pnakTkTf+x5
	l5U0LA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014m13b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 13:53:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf004bf8beso12850605ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781272382; x=1781877182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTnfVI4gotUQ2bkxP6pmXcdIqm6lxSQhArEpxlHE3ZI=;
        b=K/M5Br+PbxxDAQeSR2ELdnqVdHLnevS34SufeQTDpB1rB5c28E+iXbQ2WO7NwdVTwA
         2rEla8Wjk4GnXILyaUFz3O/e2GrwV7itcZjBXOcqd64tU4jVwEFFVoah1EcA8tp3lIjS
         asL9cr0rxASsjZnpx9um/Lzp4hGDAryV5Z6DGQ3Amwk+IVgDD/XctyW87CNaW+65AY7W
         BYbSCgX6/yR22Jk2MVD20dWt+SDYSrlvSREPBRVtwEe6i9J7oELCBqaDTlqzY5tivAib
         m1gnB+GxyJkQsq4ULASXOVZqeHrd+Lh5w8/x63tSgPaxPhqEehnNFhVIz+RMWsMUxLVP
         qf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272382; x=1781877182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTnfVI4gotUQ2bkxP6pmXcdIqm6lxSQhArEpxlHE3ZI=;
        b=XZexKaLP7mOzpo+A7to//X/ihOPrrFEKRM+0a4ou18XLHP/0PbhkXsUt90aQ3WDujj
         NmWqFAHmocH2LUp8RwY9U7CAiq65tdnleRhTyBvJZsrGnHiAbWbf83SNq40TPJo5AF3g
         zF43pdtLK/RFm3st1P02TEZh0F5BtlAUnYV9KbdULLr6eKdxLt996OgdCsn8kRdk1Btv
         v2O+LTOuvH422AUhTRUgAwkKH68CVpS0+sP+4KXAZCJOwUkt+P98mKEJQlkbI3Kggv29
         P3+xzEat8Ui1kCEiws57LAShUGoCDvEGxLsxgDwFkvcZExHL7xOdrQysyuhziT9kA8rr
         MfRw==
X-Forwarded-Encrypted: i=1; AFNElJ/Gi+9kQDMjqAOZ6GA1jRVPXhn9m8d7WibbbdPITEbh4/YrhWLDRn3nGbL54APgNYMfYFAIBUex8DABPFpv@vger.kernel.org
X-Gm-Message-State: AOJu0YyouxFQMh9pCtCYnPGaaJmaDQC+SxwtPlimqaN/VhEzZ7ZbjlIu
	X2c9kh5zg+llgpilWvvo/uVFqwYUYYAPcXOq9K8TcCxY7j435urbzShbLCSr5RUzBcIQ3X2CXTX
	T2ObiHsFgF9X9gd4NUzmhS6DzUfEXVlhDWTqUVVAkpMOiujQVhnjN7wCNrmxzqruEZMRM
X-Gm-Gg: Acq92OEum1SZ6PZetyaMohSPQkk6ng6Os5T9Q96s1WWvpnDlqNdI2pfowZFbw22sJpA
	hMdMtT8u60scKWhC7jllPTt4azMDHk2j61YLvIu+pB+5iVXS4Z8Sliy7/SKr86jyjpJm8me8AiV
	8fWruenGhMo4O3okrH931/oLja5iA/ta3WzETbp0fKkX0Ylk7+X6IIBpWN2y1SOpbAA/Dkp6V8Z
	cmeZTWugimgUeww1uXwBmaZFXGFyrs5Sra6d/A35KornhWUn1y4lmFEYBMMEKDxYi61gVR3nBx3
	SyKUjTrYZVhFfiHEPqxXgBba0JVAa9WJnWJLo7RYjm6U3y4/ddI2K542ddXaWfYdtIdS9EWQsdE
	9ZKcYbYECkFbuk9GujyzSLsJZmqzosaDOW1r+ADT/mAPSZ0RHoDiW
X-Received: by 2002:a17:902:fc8e:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2c41198107bmr34271445ad.22.1781272382184;
        Fri, 12 Jun 2026 06:53:02 -0700 (PDT)
X-Received: by 2002:a17:902:fc8e:b0:2c2:be43:39bc with SMTP id d9443c01a7336-2c41198107bmr34270905ad.22.1781272381504;
        Fri, 12 Jun 2026 06:53:01 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.231.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb4134sm19641415ad.30.2026.06.12.06.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 06:53:00 -0700 (PDT)
Message-ID: <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 19:22:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zNUu6I-t7Q2PDVTHrH9fE47d2vV7m6L4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfXyxZylmsXiBKa
 9rLvrzYryz72LgfcKr1Z6d7+u72orAK9Dz0h8pS6ElC4jjIY6q/0ouxjobYbPP+Oly3mJT7/M3I
 jyXugUSwhOCsYgVxkVOvccbWV2E3Wv8=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2c0f3e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JaHktJlP2QtFIg7UHuVw+g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mCNVnkFJZU-R2xYHr1YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfX8qbvMIIw8KOh
 EKX0Cl9b0bJjdPyAW8t0uDZj30g2K8IFZhg30kugrTCCFDYT8QFG8+ehzgiWY3oZCfvaJz1mLYp
 KmFzLQlVBKfm+zFwQeE8bGjHaq1c9/XtS87V6BYittJxJRoVvVafZaa0+ZoMo00SXUBLxwFg2bv
 R5y4zGwNwAsHqMZ6qthXAwRT5nArKcLZOynqBgVZCi3Jlu0NE0KYC7FAy8/meSreGD73jdlgPpY
 6oD9m06DDdTd4YQ0AdONdXFVFLSRekMtc0dPkqH5enZPDtXpLLTvt+GSOoY9WM2o3GaoC/IGdYL
 BivHgVSQPKycrvam/MtNyYPOrFkG0vWvRFiFqvPzhrkN6K5XpLdy4z1JCcyFbjnDDwTnP+w0Ux/
 BD0hMh4plPV2TYEzLKyPCRRuHHZB96neUlCyyByD7+IZAWTZG08ee1SFpIuV1P8jxJGDaqPRSI0
 9yfkmJSh4SpuLwU4W0w==
X-Proofpoint-ORIG-GUID: zNUu6I-t7Q2PDVTHrH9fE47d2vV7m6L4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112948-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD915679FB5



On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
> On 11/06/2026 13:12, Gaurav Kohli wrote:
>>> Why? And where is this generic property defined? You cannot just
>>> sprinkle generic properties in random bindings.
>>>
>>
>> Ack, will add why part.
>> These names are matched with the thermal mitigation device identifiers
>> populated by remote firmware over QMI and define mitigation devices are
>> exposed as cooling devices.
> 
> No, -names correspond to values passed via DT, not some remote firmware.
> The remote firmware should give you interface which is explicit and does
> not need such properties.

thanks Krzysztof for review, We need tmd-names because of following reasons:

Following Daniel's series [1], the thermal framework supports
mapping multiple cooling devices per remoteproc/device via indexed 
cooling-cells.

1) The thermal framework's cooling-maps reference
cooling devices by index (for #cooling-cells = <3>). Without tmd-names,
there's no way to know which index corresponds to which TMD, as firmware 
may return tmd-names in any order.

below are the changes post new thermal mapping changes:
DT: tmd-names = "cdsp_sw", "xyz";
Firmware: ["cdsp_sw", "xyz1", "xyz2",]
Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)

This allows cooling-maps like below:
cooling-device = <&remoteproc 0 ...>  // "cdsp_sw"
cooling-device = <&remoteproc 1 ...>  // "xyz"

2) Not all firmware-provided TMDs should be
exposed as cooling devices. The tmd-names property acts as a filter,
allowing board-specific DT to select only the relevant TMDs for that
platform.

[1] 
https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

> 
>>
>> Without tmd-names in DT, it is unclear which index corresponds to which
>> binding. With #cooling-cells, tmd-names in DT provides an explicit
>> name-to-index mapping. Please suggest.
> 
> I don't get what is the index here. Index of what?
> 
> 
> Best regards,
> Krzysztof


