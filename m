Return-Path: <linux-arm-msm+bounces-109208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EhzLUIjEGqsUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:34:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACEB5B1460
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E8CD30857FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662BF3C4162;
	Fri, 22 May 2026 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqWlC/Vd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrqWHb+P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54753C37AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441867; cv=none; b=R202YqiVJicXHFFwPZx2LVsQtLjN1JZtND9YgPjod+wSUD25kghcNiLUPucJfBWtNKSEw2sTHrOB6kh0tOxZgECK0D4bkbOt28LxXThuG6+kTYBy/5OoKlLSG3P/Q++cOuDAmo9hZ8FPS1BTRqLmxjJnRMn9VqadjhglwG3DP3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441867; c=relaxed/simple;
	bh=+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=su2NCvyoegPaVvcbsvSbVfv/8+pu2qaUPHazZhqShZF/LM9UCvCDZwzX2XoL/jRUzpuG6lsxeidP6Wi/aPLscdXPpAd5HGe/lJfLLIX2WEqrsIO9otk++dlGHtViwukmlCmexxn0l3PrSkKRKqDCzUlm6MFbh5ZJY6Q+lmNgs+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqWlC/Vd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrqWHb+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8eUBb2765446
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=; b=mqWlC/VdunaOrdlo
	yltyKLZEPW7gGXbYdkJoRFHNtW33urNBdJjOLZSfbyPEaTSNer/Y8UxnVKfkvYty
	q0aSmnK1ICe8nVcAXpRpTKj4CfMmqV6+TwYjmNhcYmuAAllqP9lskxqMxCoKbMH9
	BS0ShXHsRzrrdR0hSwEtu3hfxLkKFxXlmdxYEV1OeJE++EMNCGegj5EEW/O/Fsfo
	lM4DhUb5R66cTGN+RXQc/9kixwBHkc4QeH+SAsGXBT+8fOBbEzN+uGDXFPc4j3fP
	hYsz2owceZxIzUGzvWL2gonuH1mW8XdroE5S1DYq2nf12RWZsK/oaoDdAOYou5C9
	+hUxCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7v9j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:24:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914b79adeb6so14789185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441864; x=1780046664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=;
        b=QrqWHb+PTT0ISrwslDH1/lAr0iwyuOAw0Ze6b25NlZ0VOUWSWa40A41C86WtEaabHi
         jgbNSzCkf1vn0bR/GaiZWdXX4F55r4zT9nnZdCTxQPv0FblGWahwepep4VsV1DYvKT0K
         V96v398AW3/yXYACh/Nytok+ZpLEVSD0pGvvgX+Iy/0kcBmgB9codRpNPbkLyfC9W7uJ
         vkyYQPSpNfMNbyRtQy1MRcWte2pgHnhHw02DJ/R2wGWKT7Ud3Gfb4swG+rOz487+VyrH
         QEgdS2SDrli6IvqN0woxBZIGa0t6VaHy5pVx2ToMlQ8F7mB912xX1BYY2D6e2f4Dqq+m
         Hgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441864; x=1780046664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IBidySudLXvX0hBrNR/qamTJH6kfsbZPwdiFk+FWSM=;
        b=LMQ5ywiKUJE0CLYbzTIZMvg/s5nprUZIpFq2C+mh49EpVxaO0DgnaTxX15K6lg0kVr
         DABbtZi8XP24TcmHWbwmOMEZxHnkc8d8kXXWLloIoInW/heaoy+wdQISahPXU/WMKLxE
         QIXOsGUuKl63d/1wZ0qcvCSFYCYobVRue0ii0IkA5JIgMl19efbJbpcos0Cf8/pQcAOV
         wL8wAT+A2rfAbSgFEAJhQg2YWehZIc/PgpVReIkqQaOQZpVdsb8ujXg9G7DZ7hu9+EkD
         zYFYzHUNZzOdMPX/dwETnuMyv38EDmSow8vhA5Ok71c6dINOMlhXLRkbrAnStrLT77pd
         BxBg==
X-Forwarded-Encrypted: i=1; AFNElJ9GtifxiYpF3aWqy8+tudw6hUTkpmXZ87l5/+fA9MiL7k+YecygBDZYZ2P+3xnflOLQp2enD56UKwN8gGa8@vger.kernel.org
X-Gm-Message-State: AOJu0YyUUUjUxvMPyr7eXTi+MTcPsYHwzbGjESKYw3gxAMBix67eacT5
	ahaZ+dIOqvVqjHLkZ2kDPqGZhK4Q7vccgZP43J4zA0hV+2igf1Z5cc2P9QJ8v2yk/i5hRBEKeQD
	CCZPK81wLYg17+h+YHeq5DxHMpxjmrt4NhB1mEs5NipiNWwctyIVzHi5eVpGgkoPhs24o
X-Gm-Gg: Acq92OHbcL9GZUqydITVlxYtD7ghv9Gft8J/acxTSpuzI/0h85tLSmO3tWXCqWUea4u
	USr+znrf2YIrfFr13ZP8qs1q/DGJBac8I822/hYOOhM8UiEuRJ86tkKsV4ahvlfUVE+EzX9iFlD
	MWOLSTooqJSEEh6WOqbD3F92kg/p/W7EFhkT69wMumX9w/5avSoEo+CkzlO4FFW7V4thGPXG6oC
	wn9jb+T3r4pL6A/Vm98JLfYcmg5JGZuJguNcj3Q73NPOPA5J1ofH2L20dsWpZM9tJxlfI57AoTU
	kHaE2lXH/lJgMI4O/W3jSTadS8AkSUergoLdiqUk2+R9OX9P412xWT5j1BMk0IOjkiiOTs4++XJ
	Z854hEwRVjJ4Py7VEzcRgc56XzKk+z9GwVSRFuHxGdOtIew==
X-Received: by 2002:a05:620a:4109:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914b460262dmr299246385a.0.1779441864061;
        Fri, 22 May 2026 02:24:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4109:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-914b460262dmr299244885a.0.1779441863651;
        Fri, 22 May 2026 02:24:23 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d6369sm34163566b.45.2026.05.22.02.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:24:22 -0700 (PDT)
Message-ID: <82019c2e-6b6e-4edd-91b3-a28ef6eb09eb@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:24:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
 <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
 <86f76a81-832d-4ba5-81d5-38b46b7dc0a7@kernel.org>
 <6c595a5f-b979-4e8b-ae77-d28d24700588@oss.qualcomm.com>
 <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e07085c5-0fe8-4ea7-8e51-ebe104e7aa2d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a1020c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=diiQsov5Z0b7G057BPwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: n_ilH-jKWNMXKf6NXT5AEt9bCkK_BILZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX6BHOADNweENl
 pbe9WREomsc1uz6Pmd6I82kgc6m1aFc85fU9WRIjVQ/xITO7x8bX8nUNxdmJtxrcg+jyxtmy7OZ
 HOnAqtx81i8bpfCrjNuqlsFa05VG/ug21ENlBYB8qVuyJNNdxvT/NcIReYI5W82amNFng/g0s9G
 AU9pMxaN2ldMxYyzGEXiKSblyy6cnzGRGFZHzHRer+5fFGIBbD/dn5+OniCXNBzQlo5PqLyIcKJ
 gVXMOpl1wk9QCAzrYbgC4jt1/Yf39UZxCpIxZeQdmT1MD741sRXJKb6mdVE1r5rKE0S2A73qdZO
 JaAyDICnT3cl7j59f1p1aTll9ghdUWGo6EIzEfKqkfD57qqj83OCf1NrM2iUlTOoGDMlNffuFTI
 3KxM0VKsf3zal3L2tU3Mbs4aTI7eC/VXay8x/H5kkCUCpHk/eNlCYqsqnB/k2XGXrjAN0t+9M0D
 cYIuwP4JdKk2ZN/Exag==
X-Proofpoint-ORIG-GUID: n_ilH-jKWNMXKf6NXT5AEt9bCkK_BILZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109208-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7ACEB5B1460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 11:58 AM, Krzysztof Kozlowski wrote:
> On 21/05/2026 10:46, Konrad Dybcio wrote:
>> On 5/21/26 9:20 AM, Krzysztof Kozlowski wrote:
>>>> Since firmware does not have a way to dynamically tell if it on a
>>>> debug-board powered device or a DCIN powered device, We are required to
>>>> add this new DT property.
>>>
>>> Neither debug-board powered device nor battery-less will have
>>> monitored-battery, thus again, why lack of that property cannot tell you
>>> what you need?
>>
>> A device with a battery will not have a monitored-battery either
> But why? If for such device property "no battery" is suitable, then for
> me "monitored-battery" is suitable as well. IOW, if you say that having
> a property describing batter is not a accurate hardware property here,
> then neither saying "no battery" is, because no batter is basically some
> sort of battery (just like empty set is still a set, empty array is
> still an array).

The battmgr service running on one of the remoteprocs already has all
the information about the battery and it also handles all the type-c,
PD and charger configuration, only letting the OS know about the
results.

Hence, unless there's some other hardware at play (e.g. for custom
200 W charging), which wasn't fully implemented in the QC firmware,
there is no reason to describe a battery separately, since the OS
can't do anything useful with that information

In some abstract way, perhaps monitored_battery = <&pmic_glink> could
be thought of as valid (since that's the data source the OS gets to
see)

Konrad

