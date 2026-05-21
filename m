Return-Path: <linux-arm-msm+bounces-108928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAuhCNqwDmr6AwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:14:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229159FF43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2130C30207FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 07:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956A0394797;
	Thu, 21 May 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCY9f/ZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQk1xltg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320236AB56
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347631; cv=none; b=Va1OScGmEKImStnrALtcUSOwitJJh/bE/lZUHLKkcakn7Vlh9SaKEhsSUY76kqJJbIYFvAYADC53+54l2exouFXaYW07AzpO3kVn5HN7ug+peR+sJb+3YxJXpGOy+Jj9TUzpVsk8gC4hTVdAM0hg4s2txadgD8kOEGEThAkHhqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347631; c=relaxed/simple;
	bh=Te1NKs8fWDO6XlMA+s25H1UFXnbbfZgyLuRr7W5e740=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+xJwJ+8GcaNpX1xlkBU82q5YH7w4wsV5lOSgFXuw/YfTJrmmivw2vqwUwc9C18vXd+6mT7RheZlGWlS8PkU3+1b5qVw7GxAE0z88GghU0w4vTYTZdLcjjre+8yMY8SpMjvkEiVMk+hyZHSG5KOPAdbiIID4fm1Cc0UT4ceIDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCY9f/ZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQk1xltg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6EwCN1798618
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQSxh8R/sOxApxveA4z77LyIilrjUVkvImF6KBXRudU=; b=CCY9f/ZVbVYsHv06
	Q+zbIyNiJrwBIG4RrbwGtnMtyoTKSyZxnIboHwZYUjDMnJoCnSUDQpVTrUZuEj8q
	3Uzy9T9Si836ICv03FAakg58TJhxhCSaBL9aI3Y2lGldYA6WO0PPrJFicXKPQrFA
	Gzj+019i55UYx3y7MvpOSuJ/tJpnqte0D3xyw1bi9BLyGmePE1SEMP5izlxd4+5E
	cuNN/kus3khQfs63pDa4ZlQmZFSAKiZ56KGKmkhB4VlFqIq5Kf2F8dxkXpYpDjZc
	a+edAiz78PBlkB7HbFxe6H6GFz4qZTElS94nsdRqcXIDZdXdg9Q2YajfDYp2eE9+
	hn55Kg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu3p9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:13:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-837d0d71c61so2948929b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779347628; x=1779952428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQSxh8R/sOxApxveA4z77LyIilrjUVkvImF6KBXRudU=;
        b=fQk1xltgH5GZ9YCJPVuUvpBcBKf0jf9liSvUWAM/mfjOiI+Lo5SiAA7a31/f6DD/cF
         VbAQd7ty1vP2Rtokoa7QXpqML8ehXuMcDYC6xYpi5Gott1A3kWlxPZjG7zkeM20wcw7X
         iJa+YMbVbUxpTtiuNESJcBz4Z8MOmK4Obe3PFZnajmU8qslV6yowIHtpOU2CD98I5bwJ
         pIdcnBs2Uh2RytPpXcKVc8Uef2t09zYWj1G0ntxFxmp5xwx1hBwx2F/mrkFC7+lDFtFy
         cbXOKI1HeK7cFcixE5Pwu5403PhPd/fH5rK/ryS4xeZPrZKoFcBYJbwQ80Gs95Sv/h23
         3EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347628; x=1779952428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQSxh8R/sOxApxveA4z77LyIilrjUVkvImF6KBXRudU=;
        b=Bq5iXknYgJcbmqKBy94BMiA8VdszygbdSuiKE7P7IvtDjJJK1RgXgw0QXTAJLuXT26
         sqHo87O44i2r27DeYqcj0HJwgq52ou8KY0ZH4nqwxPWwsepjQWGGnUPmuF7ajkyjBD5f
         I4KB5+C0O9GESRHL8HKR6rU0hgAFHvCTYGpOKyagGxxh0XX+4y8VRnguv7OA1JNyBMdp
         xt7LvD4po2Q9WoA8vsVZ8Vh3Ebqm5ttWaOlJvtfknLu3ktGYQ3lDNiskYiy8QsuzsmJA
         gKP9ppl73g0/Qzc/CJk0Sj/O1F6OGL0LVhDfgsv09eQU//ogGi4Jq/RQsMtfk+7ObErK
         WrLQ==
X-Forwarded-Encrypted: i=1; AFNElJ90NT70x5nQy5i7/ezK1DSeAoTLAVN8uFzqJ09VEM9ZL37lgjIVXAH6z+vTigVpv15KAdnhIPVRcdqsJMsU@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqvRo5kIlWJbBxoUOGk0VYEsu450UH01o00NIzLGGBb0LtoWU
	eI93+OJ/qQNSqqRmNCffV46lj30TXu9sZiWuqi4idzd65dRzF7UJEmRMlLn0ydupND8tElffm0H
	03j3YQfxhvsz9+rJTvpOugEUSn5ryMFDIMJj43qe8ewhnnZZcvoZ6ZrqUJUQVfmrkmp5/
X-Gm-Gg: Acq92OGwBcxL+yBnn5X/MlPO6pEfR9b0MpCOjF32ew5BG2rwQoy9r0EO7zQ9Tu1VCg1
	k4sfpelBINV1bHR3G2BhgdEFZMaLOW05focCOL5KsBDSgu6o/N/vOvW+o/Pa/1apOgDO83YkeNw
	74RYEglsXgdjD74Bexz43jtq5ASZTh1fxwa54QdeXvZveFeBuKr0F//hLZjGauHvFMglKQHVq7i
	O90j9pKmJBQo7848rqn58CUQ18oHcWF7b6GWW+J0doYNM/d3Yq/8Itaj3CGjgsAbQuAxXhnPwJc
	A+hI4pr8oSee/VrHFcxN+XYa8RE1BMG6NvSNxWrEWh9rFeY4YYPc5+KuftxGP1bej6bHzb3OAZ9
	XdPJKCkjnshPEbsmqI6c35rLh2mynro63uVndIDtiZvKsmBWserd3KwhdO8QlFw==
X-Received: by 2002:a05:6a00:bd8c:b0:838:20b7:40ed with SMTP id d2e1a72fcca58-8414ae5d79dmr1859332b3a.42.1779347628410;
        Thu, 21 May 2026 00:13:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd8c:b0:838:20b7:40ed with SMTP id d2e1a72fcca58-8414ae5d79dmr1859287b3a.42.1779347627934;
        Thu, 21 May 2026 00:13:47 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e44a67sm307513b3a.57.2026.05.21.00.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:13:47 -0700 (PDT)
Date: Thu, 21 May 2026 12:43:41 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, jishnu.prakash@oss.qualcomm.com
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519-first-wine-bulldog-a6a4c7@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2OCBTYWx0ZWRfX4wX8hVn8z0+H
 ykfil75FCKmmvKsl1VqsYyi56XhAvWfdSOSugQSMugAnNSMIntUzvWcOFAXwtyvxDYfJRLumzHm
 ESH/lFwK0WcpzT1DcuJG7ZQDXZoJtUCTzCdA9dfCpDGBiatL+nT8hykueTL9eawNP7mEDFSG3RP
 WrI5EKS9QBe5jN7YZtWrmVN4FRBu9EpI8xbpeY+pYSYzHV3AFdYgcwljDShnEBWORV95Akz4Ze+
 O0YNsTwPLEboGLZqexjxGlCbLtocNbh2y/K83TAeDGlG3dl27EaEAs+jGZfqT8xutpQNoNv0idU
 PeJVW2ij6+l0swHcXiLLm8B2x3zqXo1CjhtAaZGodp/CeaSo5QaKkb1fDqhuB9voXY7mP50FQPO
 uZAZcqC/AHH5/nbmpRNKGJ/TmHl/gfAy4T9/Wo9RMNMWd/JAe86hFCDoIhDgju27ruAgbdK8IEa
 MXXrKLMC+n+JPcIC8Cw==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0eb0ad cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Co5pMWS8BZywBcWCmhUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 5DiK-eSyxEJ56BVyvcMMzHZ1atoCy_-F
X-Proofpoint-ORIG-GUID: 5DiK-eSyxEJ56BVyvcMMzHZ1atoCy_-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108928-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-kamalw-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7229159FF43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 12:35:13PM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 01:55:26PM +0530, Rakesh Kota wrote:
> > 
> > > And isn't lack of monitored battery property enough to indicate that?
> > 
> > Regarding monitored-battery — its absence alone isn't sufficient. The
> > BATT_ID line on debug boards is pulled to ~10kΩ, which is used during
> > development phase where some battery properties are still present. The
> > same ~10kΩ value is also used on some genuinely battery-less production
> > platforms where no battery properties exist, making auto-detection
> > unreliable. Hence the need for an explicit DT property to identify
> > hardware platforms where no battery populated. 
> 
> I don't understand this logic. So you claim you have debug boards which
> do not have battery, but define monitored-battery? Then these are wrong
> and fix them first.

Actually our firmware treats the debug board as a "fake battery" rather then
a "no-battery" case.

This is done to avoid triggering shutdown or trigger power/thermal related
mitigations to kick in from the HLOS (android) that is configured mainly for
battery-backed devices.

Note that we can know if its a debug board, just by looking at the battery
ID resistance or the battery profile name in the power supply properties
for `qcom-battmgr-bat` in sysfs.

However, the problem started with the boards that are battery-less and
unfortunetely used the same debug board batt ID resistance value, so from
the firmware side the batteryless board is also seen same as a board with
debug-board connected.

Since firmware does not have a way to dynamically tell if it on a
debug-board powered device or a DCIN powered device, We are required to
add this new DT property.

Regards,
Kamal


> 
> Best regards,
> Krzysztof
> 

