Return-Path: <linux-arm-msm+bounces-109710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ITCM2UqFWr1TAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:06:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D615D0BE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFE783013AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B78517745;
	Tue, 26 May 2026 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mb67mpL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bb1O73cR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E99303C83
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779771988; cv=none; b=Ftupnldj3qoyIR1N+Xha+qkQfNRFD+k6XaxJtNuntoXKjVpRkgk6unPSyjPuloPLd/yQH8IfF0fErDi2icSOxy/Izv78WZnBrXacozGE3YMts5tDuzUxIiwCQP8Hq1b8TG135HSzK0SApufSkqL6Mm4Vej/s2oH1twwfi8FaJdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779771988; c=relaxed/simple;
	bh=CNyn68J5G4M9q4KLWttx8rNk0/rLkzFbuBx79srQ3mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0IDsOTSk/UUv/4nY0am2vLN6fU2qoXugplVZShHj1S9PmCwl6Y9wIAElMLZ1o6b7z6+zcEIIbg4ZSCod601BL+4tjnmHpZynYBnZ3VcJdCYuuAZWhfwSPY85omgqjXMPJtnG4vvA7OJePH/JfBVTeWbMNYP3aAbauU5/AfBhu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mb67mpL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bb1O73cR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2UR6V4117444
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vyeclYrLbQjRr+lJ6lGO9a+S8wl5YIcUP6BYDVwCF68=; b=Mb67mpL/fX44Hpiu
	KHzcgtZjLMYk/mD+nL8xBrliSGTKWAOy/EZYMIlIrMa5zLQs1GoqsE691QBRnMrh
	n30by6FDs2zxW2xIrDEdnpn5oZzgZyFuvzlWDrjs+ZuMnK+ooVNML4OfhtbaMrlW
	he5/H6d9SO3kXp2KxbvfBM2S/b5QUWrbUKPIz2Toxy+YkSEkxd294BmViZofwdNq
	bXRWBftBqWSk2lITtIDOYmpjafL0f2KhojTyaa5SAE7ipc9OUFVhEoetXYgYOUU0
	2+LASQN8fWvd89xJV5Vg7Ix59H4Qlc2V0SPr5BShfdQLLNTHuKErN5pSSG5alyQG
	ysX6Kg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecquda6na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:06:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-135de949041so8980898c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779771985; x=1780376785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyeclYrLbQjRr+lJ6lGO9a+S8wl5YIcUP6BYDVwCF68=;
        b=Bb1O73cRat3sEYtD/HoSjvyyisKgdE6a8j3jA0JuzwfGOr8lQmSyNrUt4Y8VED9k5b
         3kZm1xvjFbc8CuhqSnUBc3WOnoHtqoMxNWHgwx7tQ2q3qvKbKe2sq6e0HtNwHBxBV7sy
         4DfoCoNJodtXVvyMvvkgs6pOZDtXB7mS2jk9vHZrKIQTirx6eI3mkpaDbkIKUScfrQju
         jn5JV/ctKqwaM+FzesqLjZN92XsqhwGe/ASajjwLDcsUUpAxpP9mWg7D2UM5tMH8yRi3
         aEN6SingtslL4ac7RnALN47EXYji1PUah4dMVrquOIFvRyiuifQalzrRk2HTQtNDBh2Z
         QG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779771985; x=1780376785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyeclYrLbQjRr+lJ6lGO9a+S8wl5YIcUP6BYDVwCF68=;
        b=kOIC+CR0nl2LUwD6t4tF4ZnUGn4eg3A3U7sRWob1evZoSyWm2VhTrPmIe1H20KYt8J
         3MVWeh/TAQYxZ8AEp1ANJH5ri3l/LhLIXrPuh/2aFaCQplM/sTrBI1a+Xe62Dh2GTKrS
         Yfr8/B1t1kBrafhzB3OwJlUlgppitAsJWSo5wyfyv0H1GK78XlnXijR4jEL4Ewdj7rWN
         BFrVYVd3ssFm38VRCgiKZ4TC8UTva7n+7k5kLGZJz6BA6KBdcyKfdBegoo81OC7VwmFm
         +itkXKC3w5S9GzY1U+GqVXq9TIFiOsNuy7sVAmg320OjUd+wOYGkJcvh4vwR2Q1evJt2
         KPIA==
X-Forwarded-Encrypted: i=1; AFNElJ9wWmjfgki82SccTIQxpGxyl6Xrevzxz0LSzmIj5LQEkEr3EEPZ25FHg1vZJBcqY9sz8k4sbcEJnLkMzr1t@vger.kernel.org
X-Gm-Message-State: AOJu0YyZeGF9D1iCBehCl7Jv2TIrJ2ClW3twRxE9b+4Zf31wNNkstDX9
	UaoUAPc3CrymB9YK1DtAo0RD2FczqYzeB6908pzvH5z3MAZBscG21WthbZArttNUcznSxOtIUGI
	0ASXmF7XJWb0Qe750uTegyflscz9cbJOE65la/0nFtixoUcdFVZzWIo/R7DS3GI8SjNOIuDoysY
	28
X-Gm-Gg: Acq92OHykeT2RKOr9GwhRLFqbYwIzWSW4CVUK0ANNQw/uYx8AhaQfbZx3RcKRM9lO9v
	OJR4g/6f5zqnUwP+XD5m/tIA0HfIV1O4ttPc3SiGc081KYw+nrlKSHpcEYEyH9p7t2yozVUX/kF
	TpCXFtnxm0RY8ULD1WzN2IRlZbydgiHPpdsUfaCvKwkLw1RS/slEcZaKRKN5eXM5fNgLWC2jhl8
	M3UKQqgDM0EOSVhm+1w/q/Frz5itlYI5ogDHSgb2IwXBRWecKJ983DmUuGCkHmuvP6iR/kzI+wu
	oll3im5+Ig6l7IXvdmG42inJ5Q29z1/stKVPOxFnfoXhpl+Apm1HR/HF7PRSqZGRG743P4vT/YQ
	rwvfGbAPST3OR/i62eL7EFctITLUVGKkZSzd656kyrxnH68C09536nw==
X-Received: by 2002:a05:7022:4b:b0:127:3f2a:af21 with SMTP id a92af1059eb24-1365f715d57mr5333420c88.15.1779771984871;
        Mon, 25 May 2026 22:06:24 -0700 (PDT)
X-Received: by 2002:a05:7022:4b:b0:127:3f2a:af21 with SMTP id a92af1059eb24-1365f715d57mr5333399c88.15.1779771984083;
        Mon, 25 May 2026 22:06:24 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aa88c7esm7477591c88.10.2026.05.25.22.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 22:06:23 -0700 (PDT)
Message-ID: <c0daeac3-1c13-4389-b48d-92f3c3a1643c@oss.qualcomm.com>
Date: Tue, 26 May 2026 10:36:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260518-add-tracepoints-for-qcom-geni-serial-v3-0-b4addb151376@oss.qualcomm.com>
 <20260518-add-tracepoints-for-qcom-geni-serial-v3-2-b4addb151376@oss.qualcomm.com>
 <2026052258-scrooge-friction-fe21@gregkh>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2026052258-scrooge-friction-fe21@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QjrsIuLFpuz5pnh0-2HLMghTmX2jHswm
X-Proofpoint-GUID: QjrsIuLFpuz5pnh0-2HLMghTmX2jHswm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MSBTYWx0ZWRfX5lRu7JRoDMPb
 dn9Mb9/xzv+YBtF0R4qyjCe7lummnYm2fF7MeTpdL+XEXAo3zO3W3NBmK6yWD2xMMl6PHGKQvJv
 wFuuMamh12gxT1WNQdZCFvv0ScFAmujHZtcxjVFGcIIOmw6s07tKdEDdIK/XGNTtMim6JHOY/Uo
 GHWWrc4Jt34I4Ks/PqJ8Ki7Vh3elDcQt/1khPyG1V7qAHJKv5ed+eOL7XUX6qz1eykUMjjDKfxc
 u2nBt/5rNxgbuDU7InpSC8+fvJznjejBng1HMukVw/EZo8Xrty3DehmJ6Io3iLebahWlPVp11Dv
 SjTe+e529FCPbfg403TgOH/Q8h2vhIdj7JXPQfweotZVNqs4GEalB+90Co91Vz2bMKO96gpMiRm
 JWRdjJk21LTOihrMXjriqdWB5hPysbDxHCICw3wbj7Jwd3ZBmy31xBjSKm6Iobg5pVpOYLUsCV5
 dTcPTmpOfM6JBNzcUhg==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a152a51 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=RqynvdPmTcCa9fdhPO8jTQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=reC4vt8OQQWefjZzLvgA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109710-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41D615D0BE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi

On 22-05-2026 15:17, Greg Kroah-Hartman wrote:
> On Mon, May 18, 2026 at 11:26:56PM +0530, Praveen Talari wrote:
>> Add tracing to the Qualcomm GENI serial driver to improve runtime
>> observability.
>>
>> Trace hooks are added at key points including termios and clock
>> configuration, manual control get/set, interrupt handling, and data
>> TX/RX paths.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> v2->v3:
>> - Updated commit text(removed example as it was available on cover
>>    letter).
>> ---
>>   drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++++++++++++----
>>   1 file changed, 23 insertions(+), 4 deletions(-)
> This patch did not apply to my tree :(
Do you mean these patches are not applied cleanly?If yes, i will push on 
linux-next tip.


Thanks,

Praveen Talari


