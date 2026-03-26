Return-Path: <linux-arm-msm+bounces-100104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDvCFnYbxWnr6QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:41:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAEB334A4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 12:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C780A30252A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEAC3E92A8;
	Thu, 26 Mar 2026 11:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIqVfVqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCsDHUEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F6D3E8673
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774524847; cv=none; b=upex6f2ocIQpnsXmM68Mgx0NrIVy63ui7AB6gzd3gWG461147nPb4ui2pWsAof12H9aBdEk363/yd0WeONBMzhxH65OwK+22pBqASOVr2dXdrEofejBoLUNt1d95T1e0Q6Ozs2pHFWC1nCeCKDEa+LIt68gl5ApVvKuz42wNF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774524847; c=relaxed/simple;
	bh=p5eOJ8UP0LNtB9lHbCk2xWsNKUMoenzukYy1sW1T/LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwKwM9CF8T7SDyJdEn2P3s4gBv5NeOoYZ2RCh5a/CbPJnBXoyltDTvxkhcCIUz73N6NcoCC/R0qZYJVXnCGgiRdKKT/wI6UYEn+W46Gwa+GlXWymkz/2taViOR0167w88y6FGoZAAjG5jAZV59dqqVgv+ufIvtAlEG6eUvZhby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIqVfVqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCsDHUEy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6B9dc1965120
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkKtJY/neo4snbhX1Pu52JIsgsMpo3+dszfpnntdauo=; b=TIqVfVqPEdWhtOZi
	DJo8cSNbuSSHbtoMOvX+WkGAuN2dX2GNXAcrWUJiPwhY/Yzu7ADAObnUeIT/p83R
	TXhMEXDOJ1Nmo8rzM8C1FzH771IOcHgNhM7MP8qx0NmNls/zXbk07Ke0WOZiVaBC
	vEEK42tTU9vewugowPLmYpGmRSUlcrI2tqE64hrPE+GLHAl+S9HWIBXBoi6cSbFc
	svNJu++SLY7zraZ1wPixjiAKQGK6jdhPPFQ8eTcztMVhP5Q9ylcYH8lkM2uZHLlC
	qy50LxgMeNjl1rrwZeeK8ixXDJ4mJcVoBdgr+p8wWlneSOEizU75mgPxosITis6P
	WW73dw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymjky1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 11:33:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so27345085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 04:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774524837; x=1775129637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GkKtJY/neo4snbhX1Pu52JIsgsMpo3+dszfpnntdauo=;
        b=JCsDHUEy3CxoXnq7GyLuuj9RPjuWi/sOO9qBxAQpjVxqUHXj1gSlAl6ItFY20nkgUf
         HrfpIw7Ca7Ae/rqsbww6Lj033R7diZ51e4XXc/6uqT+Jl0hinged+FxMV3mY/DU0ztNF
         QPq67oPetNHYpJDB6FfXToP9n6R3dgk8kFoj8v/gJhnMCpJyNpgjpvt0Bw8igFJXsvw0
         OSYIc9k4JowwK5N6kJ9aHtc2xu3DztmkC7w889eqwm9Z6FEm87RD1q0/PA+rhdDM3a5X
         iQkwFUuGMyGb2leC8Vs1mfXsLklwaJ+5oZMhr+iHomOlQlTcelZ2J/EvGaqtCOI4+iTz
         7f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774524837; x=1775129637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkKtJY/neo4snbhX1Pu52JIsgsMpo3+dszfpnntdauo=;
        b=a8FEUKowFAdga0sTOog86nVHnZ5w1IQy2050WleUmb+4K2UR1ixkLa8OP/J/VvW5Zy
         ymA3imqArdrAP+awd37YO5d4m6ddlrK2O+bhQoHK/e7TmM0yqqKTGLGvZzKyphkq/EtW
         fL79odqz/BKDub5I6Z0y4VWrEzfIzMBWSaz93yNVVN5nadI8jFDKqBzBI/IeRryxajuy
         nAX3An/yzmqi5YmIuzBkmbkCWiCA/VSEns0qInJaKGuV/460w27vi4vJSEZPweskEpBS
         XCqgc329w4TS8ngwf85xWumJOIpNdkyyy1qpKXCyvC/VbcCW1y1S7+Jx1jeDqINur5fH
         p9GA==
X-Forwarded-Encrypted: i=1; AJvYcCWuoySnPNrEUg8slOAvWX+WR6NNVsvj4gsPqgkyi750JaL/0SKIKN5bXEtOcs+QmiM1cQJfCS9IoBlwGmY0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5DI19gucEDr+DyXc3cAT+jJO4bABBuhVpZCLkoAQly/LjVE2Z
	0n+xNVjVnW///EWD7Jsanx216XhIGuc6DqJ2i+Q9xsaa5yQIj4OMsqt+rcbGTjh05eZ57Uf7Tc8
	YoS6QC7LTOU3DUG3x6y9tMIAWNLXDRCDDAKr8vS0ZG15X44x51l4wqEYaUtfoyt0qU0ST
X-Gm-Gg: ATEYQzwM+5j31sASs5W+ngqvdArT4KcC6RrHqxBE7FegUzFTx6o76WJe4LgbK863DWu
	fDhm7uDalDfwo5VO5HyqX+nok53u7QAuucXGJPmUQnFdzSwQAUtFYq5k+K4NXH+lO5eu2bDGKwO
	xXDkBujnOIf8/sm/6BYLpnzt7xTGVMrP49iHH5BeKtCi0k1YPyiC+qdg/1YuquXqapLTPwhoQcG
	6yVnvUxsh6O7xwoviGcX+Nc/dJs9wUWQjs3/t3tmEjib9dK+fFujn9TBExU7BumIDzAXP3cwf8s
	Fhqger46PBAIhlEXvG6ukwCeE/8MtFvUCe9OZIaK4yt9UMc0iTXk2xIC+gocxSwZNsEosEwzaaY
	NE3ErCug6yH5gqDtyj81pnoShmSsrMz2cNrimJo71jtFsym2IVz29Mekx1arZss/cPiD/goVVe8
	CNsUA=
X-Received: by 2002:a05:620a:711a:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d001225dbamr713467785a.8.1774524837162;
        Thu, 26 Mar 2026 04:33:57 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cf:c757:f1d1 with SMTP id af79cd13be357-8d001225dbamr713464385a.8.1774524836579;
        Thu, 26 Mar 2026 04:33:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b0bdf75b2sm434716a12.3.2026.03.26.04.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 04:33:55 -0700 (PDT)
Message-ID: <892fe03c-f3d5-4b6c-b821-95dad55fdade@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 12:33:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
To: Maxim Storetvedt <mstoretv@cern.ch>, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: marcus@nazgul.ch, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
        abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
        kirill@korins.ky
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
 <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
 <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dfeEWtpPuhPr1KtXBHFklZsrlLz1Mtba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA4MCBTYWx0ZWRfX+vNuGVi4Hc/h
 ueWkIzjiayLVylZz7N7DzWW5MqAns+k5GbiSDBgPMUlFqM6vWZxBJpbnmK4uEHKYfkKUkVoWFcQ
 S8G1AOq0MA6L51etTNUYFcTNU2p3BgUynQxDeESR4sQJVTA1j+qAfZ1EpDYmhQ4qMGbulFh3P6n
 rCKHGqC8BCaD55O6jwck93foh+o7Uk3buxzkXleO81XTM/YCImnxvkGeY4F1aum9Il4bQOUxZ/s
 E1Ok5jOzCrGmtVmKOVntnllzBAZmc2OClcrmh60XvKwSVJMr+NwUQnjUKqrlQjyKXmN7N2f4Mf/
 04YtQU4GGxAygLmFo95ZRtPxTCaQfjsWkmmUwU9fQbjypJxHdSp6ODWPqIm9XRDKP10sdxNvaz/
 IiNDLjzELWtuLN4ONR9o7Snu92JEmRGgbp/gd+QHGQyShAd80cl9gKh50fDZGi6XukwNFYeeRvC
 Dc5UM1c77JrL6nUvSJg==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c519a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=GZ5DO3GdeKtHaIBBAEEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dfeEWtpPuhPr1KtXBHFklZsrlLz1Mtba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100104-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,5d:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AAEB334A4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:30 PM, Maxim Storetvedt wrote:
> 
> 
> On 3/23/26 13:17, Konrad Dybcio wrote:
>> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
>>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
>>>
>>> These use a common dtsi derived from nodes that were able to work on Linux
>>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>>
>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>>
>>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
>>> Valentin Manea, which shares device similarities:
>>
>> [...]
>>
>>> +&i2c8 {
>>> +	clock-frequency = <400000>;
>>> +
>>> +	status = "okay";
>>> +
>>> +	touchscreen@5d {
>>> +		compatible = "hid-over-i2c";
>>> +		reg = <0x5d>;
>>> +
>>> +		hid-descr-addr = <0x1>;
>>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
>>> +
>>> +		vdd-supply = <&vreg_misc_3p3>;
>>> +		/* Lower power supply is not enoug to work. */
>>> +		// vddl-supply = <&vreg_l15b_1p8>;
>>
>> How should we interpret that?
>>
> 
> This was in the original patch, but using that same regulator appears to
> be enough to also get touchscreen working on the 16" book4e. That said,
> it still does not work on the 14". Something to revisit later...
> 
>>
>> [...]
>>
>>> +&panel {
>>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
>>
>> I think it'd make sense to move the compatible from 'common' to the
>> 16in DTS then too
>>
>>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>
>> this matches the common definition
>>
>>> +	power-supply = <&vreg_edp_3p3>;
>>
>> ditto
>>
>>> +	no-hpd;
>>
>> really??
>>
> One less thing to debug while previously attempting to work around the
> "illegal link rate" error, which turned out to be related to eDP 1.4
> (similar to the sp11). I've kept it as-is in case other SKUs attempt
> booting from this dts, such as the x1e80100 16" (as it might be getting
> a black screen using the current x1e84100 16" dts, though this is not
> fully tested).

So do the 80100 and 84100-equipped SKUs of the laptop come with different
displays?

Konrad

