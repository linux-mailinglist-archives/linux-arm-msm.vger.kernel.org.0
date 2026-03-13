Return-Path: <linux-arm-msm+bounces-97455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKerNRf/s2mWewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:12:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D7282C41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7522E30BF293
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D263E36D4F5;
	Fri, 13 Mar 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSAg5Vni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLkpz0ju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A51B325727
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403818; cv=none; b=QqwrpYqmw919RhSJOM89aiCi4zLRiF4pPq9sCuXWN1NuirorgvuoLgMap34wgyP0ULsMGY7ciglPsDGUTThWq+3MEvDaUPX127jQXf/6/r107eQ56dGpUu1dSXXh9Y3YWsjthvCU+uF5yF926ZWk4GJpVO6oBfPHWrdhOEEi1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403818; c=relaxed/simple;
	bh=3j40h47Hn4awqL9qP/MPQoHK6+d8901Kvhjnk0RZ0xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uJbfklSMcZ52XIApT3B0a9CvtYjn+QczCwy5ugpd29WpGWFS6YDzBoBeQcZ1NaCj/7iMG6lN0nNTOwYPKHKfO6Evp689eAKzLl3iM45ekkCqH0R/icK2Mbjky49vRzNzle17Pny2P/nVtGxLxMnoym26t95OP/ltS+2rqDeiPU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSAg5Vni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLkpz0ju; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5teYG3342525
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCbudEYrsbIZxOttkpxzt84Ar9N49Wo0ZjpsYXWJucg=; b=fSAg5Vnie86E6/5+
	G7DimziqQ38PzF8DUYX2G7XRjsqEo8MGBsbEuwRa8sjX/ND/j1TUVMHyhftGQAs1
	5ur5k9ywJEgGjL3I5GByOvpGFuZzHkqTT7ERsQGySg/Mkxglw/VVFqNZd+IPY7yU
	S035NbeSCpbfw+ZreOaGu8doio2lIqPJvfskt+yYXKONkruxrWWIV+YoklKjDFLa
	SV3r4JUAch5bUjHyZ8AyocCPMT2NU8WlbVaOfvedcwS041h0fly7b49n+VNhF9cG
	XlSkKLuclW5oZLVSjm40cz5ngZ2o6s+2R17UMiJ5ig6V4zS2t9K+G2+CsMPKRwXD
	flr+jg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4p7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:10:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a01982dc5so16271676d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403816; x=1774008616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uCbudEYrsbIZxOttkpxzt84Ar9N49Wo0ZjpsYXWJucg=;
        b=NLkpz0juqMLcuIE52tKsNtcULva+FNb2xYem3nR35bR1KU09NZgBBiLmdjaT+MDJWt
         vwJYLdPAGkwf8Mw6Vtk50TJTs/TAH2EYKnS+b3Eps4YLKFZhkocaQUOcDs1TRfVPvJCJ
         3Ilf1BVWmijSYxAeFMXEeJcDoVUeDewsXnhv6K6x/QSUqphat7ZCjtSvORy7IW7wh7ic
         BTj0W0ruy1iGyPoaXUtoZq4focY/m0GcjejBiEX4wvgr/0LRGm5mdCxdxq0ZU38ZueQF
         1ZCcfjsDc115Tg2yhcJI/38eibyX2HVYrQ4GL9+xXLilCNKPAKbRdrLz3ew9qJnGnYue
         4kvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403816; x=1774008616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCbudEYrsbIZxOttkpxzt84Ar9N49Wo0ZjpsYXWJucg=;
        b=OSzTEDVsfQhBYU2OBVEOSu8iQMQB0xQnrG9hCCyZdfwFWel0ab55TChk0qDw1Jd6kN
         aschjrUzVFvTAS9CxJi6UQXn1dEDyQsRIYHDS9EzyJIizCFJLF0DZdGk3iZOPz5+htCR
         oTB+joKBzxYS1qFz4SSUy1V02RySF1YafALdB1cnyNcABKqNElfQrMoWmWPM+TBkjDHC
         JgnyBnCCASsfL0GgTP8AnGarGIjF1G2SKlAL3WwCZCDzOj2Q4dPpK3QrXWtZNFg53x2V
         2JCd4qcZ/kJheh/nj26MfguGhhkppk8CJ+qyBDWP5JMkPPAXnTDOojS8/x1O5gxJWwmZ
         DakA==
X-Forwarded-Encrypted: i=1; AJvYcCWqvP3Z7xbq4yA5uX+YE9DpbhzLBYRSQ5Njo9gto/Eumed1ysRn4d6yWvTVjVWc0LuLhzKtseGa//bz9dE7@vger.kernel.org
X-Gm-Message-State: AOJu0YxpXuJJJn9mSxFfiZz03RuGNOchlB0/60YydX5IaT7F8z8zkz1H
	TM3WPD4XH+kN02g4uxJ02F1YsYCUAQl8izmY5wWjPi9cvZvW1JY8I7ERQ6pWCs9wzqt3MUG++1B
	DgalvpKjIQbcXHf+TUmNSkmBftJ1m+QgHSj+u6munJIISlzUcekivtoRGlHLTeFsx+KCx
X-Gm-Gg: ATEYQzzMbCxhqTGQ9fgm0eNvnjamHe4FvhbNslo3n0Wlc75Mw1rDypYNPkJUcmwdU+w
	k692ityCefIJYRSmI8T6jj0QNtoSA35rce+26yU6gWK+W904Ey0fxejeri1HT4fJScbgWcQq12i
	MGcgL2pQ5Ol70/XfPiZfk+l0Zq30IagQ4+/EtCMhpMlAhecw8DyToqlTf1LQEeIUvsKnA8UX+mI
	mKC4n/+DcRoBOiGaxNzF7ZZ0hTnuyEjBlQ5WGpwA84X+jrrEFu8fsfGEHdwrlaSMxOSVaYUCwdJ
	He57icEKgz5ddxXaJLufb6V5iVnC0ojWyyvQ6f1Qb/2FJ3AoSvmilio/F2PqR2FamHMV/9WZoRi
	8MbgybSYtWzt7lDYM6mq95GocVPheLC+GK7WbGQZZPZVpshIBg1qU6vEjt/sfgoMqL4J8GBaPX3
	b54z4=
X-Received: by 2002:ac8:58c3:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50957ca0451mr31971601cf.2.1773403815871;
        Fri, 13 Mar 2026 05:10:15 -0700 (PDT)
X-Received: by 2002:ac8:58c3:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-50957ca0451mr31970991cf.2.1773403815156;
        Fri, 13 Mar 2026 05:10:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634fdc8932sm1190869a12.14.2026.03.13.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:10:13 -0700 (PDT)
Message-ID: <6fe7a63c-a1b3-430b-a128-0e38754d6393@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:10:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 02/10] usb: misc: qcom_eud: add sysfs attribute for
 port selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
 <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
 <2026031101-cornstalk-partner-a30e@gregkh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2026031101-cornstalk-partner-a30e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 20mpOHdxT4DagyTqBv7q6_H4ihazaSkk
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3fea8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZSumbHMXNyApqtGpG_AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX9kqVJ9NModX9
 XUEoo4pivQItLSc+26+RClnMLtDWpagSxZLx12cTI8xPIxpReuS6p6kTfaZ8dOowQeETeiz+8z5
 PmHGpuMtjYmuPNNhZhCIV8BGzBCL66V+i+h/nYuesWheOgCVO+wD/NC4gqj3Ius/9wjYTbnBgOE
 iWK6lL1+9LLEwfwWXxhav3jD9jR+3Ap9XygtOkbdJhye+ifh7uOFEcAfWGI9inNowqfyNIlh8Cw
 5/0nxL8XNDe0RgfLrDQtCEgPoZNWXlEabkNwJt3Nm4GcQ8YduafxnTEZ7kf2JZjAtkj+xpUD3Ul
 IjdLNwrv3Zb2qZ82LLGrdtig2rNZ5bP4Jr56GIaiHC8RqaxGkW64L7Ix+hnHCsAnJe6kDBvn24A
 E1ILz3LM0JgqIGkplfzYhbFUUbqtjwIF4Ef/suqXZyXK8P13zqm+vPrrosrJkwHNNXLBcOE0ssJ
 ZyM11Rb3o6hWh4ppW8Q==
X-Proofpoint-ORIG-GUID: 20mpOHdxT4DagyTqBv7q6_H4ihazaSkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97455-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 635D7282C41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 2:16 PM, Greg Kroah-Hartman wrote:
> On Mon, Mar 09, 2026 at 01:33:29PM -0700, Elson Serrao wrote:
>> EUD can be mapped to either the primary USB port or the secondary USB port
>> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
>> attribute to allow userspace to select which port EUD should operate on
>> and update the ABI documentation. This is needed for systems with dual
>> USB ports where EUD needs to be accessible on either port depending on the
>> system configuration and use case.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  Documentation/ABI/testing/sysfs-driver-eud | 16 ++++++++
>>  drivers/usb/misc/qcom_eud.c                | 43 ++++++++++++++++++++++
>>  2 files changed, 59 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
>> index 2bab0db2d2f0..67223f73ee60 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-eud
>> +++ b/Documentation/ABI/testing/sysfs-driver-eud
>> @@ -7,3 +7,19 @@ Description:
>>  		EUD based on a 1 or a 0 value. By enabling EUD,
>>  		the user is able to activate the mini-usb hub of
>>  		EUD for debug and trace capabilities.
>> +
>> +What:		/sys/bus/platform/drivers/qcom_eud/.../port
>> +Date:		January 2026
>> +Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
>> +Description:
>> +		Selects which USB port the Embedded USB Debugger (EUD)
>> +		is mapped to on platforms providing multiple High-Speed
>> +		USB ports.
>> +
>> +		Valid values:
>> +		  0 - Primary USB port
>> +		  1 - Secondary USB port
> 
> Why not use "primary" and "secondary" as values instead?  That makes
> this much simpler to understand.

It's not inconceivable that future iterations of this hardware will let
one mux between more than two USB PHYs/ports (there are already a multitude
of SoCs where we have 4 or more USB controllers and >= that ports)

Konrad

