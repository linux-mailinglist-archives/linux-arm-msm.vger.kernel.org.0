Return-Path: <linux-arm-msm+bounces-91935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJBxMASthGk14QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:45:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ED8F4340
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 487A7301110D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 14:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63F540F8DE;
	Thu,  5 Feb 2026 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9P5NBtv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHKP5R8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BA2AF1D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302631; cv=none; b=Z5X9rhMQj7f6MYCI8IFT84ZbBdumL3oOOu/i6YHKPzyx36cpASa9odkODq0/vaF+Ay8lVfprpSPur9Rtr7lxkUfaaNzW/H/Vz/vKMqrg9zaI+pQTP8L9z//Eb/Zn0qxHsVk0aw0g0hCdONrIzzlZ6oFMMRfd1AjYXIKgbblp1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302631; c=relaxed/simple;
	bh=IpNri7rJmW7ImTooaE+8/fTpAUY3bxEUGpLR5b6xHiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOqwNb2ne1dC0cMyHu4hs430YqK319qAH62Ip/R+vOW5t9Icy0RFHFkOmTjWTff1z6I5HBYL9i/Xw1J0d+tdP/nydrWVEUz2xqAVWqC1sHMffsWKceQCEFmNbH+RBPU9o5uqb6J4u6wWfPu6fzZePktE0yapw0ziFBlWVmNKDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9P5NBtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHKP5R8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BlWHm4135664
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 14:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VG3NbyWRJgXUGMua3r58gn1QH8THPsJ0OMPNx0Ro0Y=; b=I9P5NBtvd5tIa3q5
	V9eKlKhWUeADMvGL7Iy/SNKTUXSKmYJ0ZcLwQezlw19TTTncA/KEH17AnSNYsgcS
	vaP6YiBRdt8Y+fUi3tT5/DaJDCTKBanrDsavYzeyJ1nl5AmfDE6JzYSoUMA8NXon
	yzostKSvE//XKLJbWsOarjxRWLLnYaitYi1yDe+jfHSNzK6sFk+HciOLUd5vgkGF
	tEsgS70FyaRZ8vzUDZsnWF4SFx0e48fZAVU5P6HxCPiP4hC8i7IW3lYuqkxUqMBL
	UcI4TT8qjg299HDJiEjMYqx5BwUomSF/xYtiAFf3sKY0zLqx6TXKIFZK9AuQwlrA
	bt/bMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tn40h66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 14:43:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52d3be24cso155776585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 06:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770302629; x=1770907429; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VG3NbyWRJgXUGMua3r58gn1QH8THPsJ0OMPNx0Ro0Y=;
        b=NHKP5R8qhB2k4/iZ539ilF+pWyYM2nIdQqvpOgiw3JHNWDFeL5PSlOlmjaeyvyLKv9
         EwY9k58wOpDtltjLaaDVmbX21rNKDJ/pcdEsxvvrw9PzIxPC1z7PPmtcekufKTt9HpRu
         5fiwbM4B/tnMBrvh+ozf5BwwOqiOvAi0fPGgWs5LlDO2GlUNfQTWdt0Em58O2lyCDG4a
         AWs8b20a11IUN2eYThySIIwIeXx1HgJl0bw1erY1ygqg77SKK6HgKcElc04mYdRbFE5r
         e4bdX67vg9ShHSzsac+iotxyo3hI84ox7oao2yPxIkzBAoutmp0EeOnG8drS9KhZaB4X
         L1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770302629; x=1770907429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VG3NbyWRJgXUGMua3r58gn1QH8THPsJ0OMPNx0Ro0Y=;
        b=EdYa+dlttUcZgwWLBxr9H2hD1sU7JP4fsX64te9zcKctIY8s4cp7AF7xYzhZxxv6ls
         P8Nl96hnhwgbo7Ozf9w8R6UHCGvgDWwGEJtYucSRGix+SMUcPvM9kr7VCUxxBCzrtU8A
         2empb2PtrXxEwuYQ+C12OgBselViHsUDTSvLTDnssGqCW1hBJ+RFxeXgEm267T6eutxG
         J/SXfdxFs2e5USKUw8DPqG6AdEvJc+N4XiiTGkjZKk9kGwKAf3LI5iYpLf/mE8ScUUH0
         marwtNLvXNvXldnm6CxtISbfaYPOsO177y+5WQ7GTY/bejQ2+jL60tHVEovBPSzzWLS/
         Z83Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB5ckoFQU6c209fBJgsBUyw6cHtM9RnBCu7qZlD0YEj+ROvFgAbxz2OaVhe5zUzEv9u0EUyanB411cuhLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxMGQEAI7WYkzSDf7xEZPwfaRlG7UMAVZAuOq7ra0W3dR9jgooh
	AXdXMgpa8YqX31psBnDT8N5HrXHcRiAs6K7+VwG2CbnSIhPqsMbADOGdXZ5+bZS13sTZqmAjIMs
	2Y0d9fBx9COpNnzhJGrkbHNIdvGsGM9EdzcBepoit0Yw37DgOG09mDmuFKrxCSXk8zpGCpDJuin
	1S
X-Gm-Gg: AZuq6aJ8tAa21WfW9k2Idn7g6bliVgnfvFh49Ghc4xLGBUfLue9RQNGrmHTilI8vzRs
	MQcbCKo4sazF9uNUtw5Xi8i83HLRLUYkuIU7qMxt5ni7uLpdGIsXloNXBFifj9iS7kTF852zcxX
	aCR5dvKFMP5INocnO6TXxFniD95oEBWrjkBM8zWKKTbhPNISrfrvS+3B2Tbh0fFQ+0hxyahp+cC
	1d/eycbJr19Kjno2PA5NxHrZAUZnr0bJ3B5hiasewmmNWEExbIIeuUhFZ33tpufpTfheDj0UgsL
	VUSq7wU/a3GH3DXPDlc8n7FFVpEW2J+wN0ekeiXsR4m85UcIC5qf9+3YpYnK4mo1oqwXwUnD7hz
	r3ntXKn1w8qoiY0RWBGdS0dZqgwklneJClYdfDkXWw/9fOovlP85ki0qkFlT2vO1MAY91fheCTx
	hLBFBjnHquFYd3rQ7GAyAFPnc=
X-Received: by 2002:a05:620a:4623:b0:8ca:2baa:767 with SMTP id af79cd13be357-8ca2f82e51bmr858721185a.10.1770302629220;
        Thu, 05 Feb 2026 06:43:49 -0800 (PST)
X-Received: by 2002:a05:620a:4623:b0:8ca:2baa:767 with SMTP id af79cd13be357-8ca2f82e51bmr858717585a.10.1770302628682;
        Thu, 05 Feb 2026 06:43:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f8cbcfsm10291831fa.13.2026.02.05.06.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:43:47 -0800 (PST)
Date: Thu, 5 Feb 2026 16:43:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: Questions About SM8550 Support
Message-ID: <plrpfwuw4j57zu74vncsx5qk7dxckccwyduhiscsqktpms6jt7@pe254uucpznc>
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <8c64d188-9e14-43ae-8950-b31347f8eff8@linaro.org>
 <CACSVV02HKpEGQ6cAhNQ8a0YiT0nXHVD8=yXOfONz=1Amac+z2A@mail.gmail.com>
 <CALHNRZ-4oM9Kpx-umvdYaMXDwBtny5HHpe1PWzFcJ9=3m0s49A@mail.gmail.com>
 <4c2faa1d-504d-4642-90d7-8db21b99d7c1@oss.qualcomm.com>
 <CALHNRZ-HzFfgeScszdHb3CtAsm9rc9UBrbkiz7wgo+dVUZ4wWQ@mail.gmail.com>
 <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ_=c0JZ4B779rCciP+_U+YMqEbby1F5RaeyUTZiNZdc2Q@mail.gmail.com>
X-Proofpoint-GUID: Kx1-bb5l9RTaHnQGmUT60K2pndLDjZ9Y
X-Proofpoint-ORIG-GUID: Kx1-bb5l9RTaHnQGmUT60K2pndLDjZ9Y
X-Authority-Analysis: v=2.4 cv=Dfgaa/tW c=1 sm=1 tr=0 ts=6984aca6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DZIS8FUwuhVlojf7X_sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMSBTYWx0ZWRfX6T5hi9Fs6X++
 Pj4LaA0BJvUz1Pmg2miqvIHq64SkWyws9kqjaaM+W7TnLlx8pMC/9Nqsc8+GV+tvXAy2n7pGgJa
 4jXCJHab9IY4sd6ZDDK0wEOlMG4t4T+HQ47KGilOlBa1P58O7QOrE896EP1UANsvAdyllfjO1KV
 0+RrHQu09hcq2Zyv7El4HWeqOv4LY6AP3RIzDp9mlIa/1vteQPkvzuvlrZAkPsX30U+TAmC4aSj
 f1ytog6/7hWMnmKb0NXEuo4xP6+8C2I21sh7c4XiJHUSsSmTvLREwfergU88164StFcPm7uLEEq
 BUkDBSX2bwBQSE1s8qFzeMwLaF/l2gO94bkSWi01oL0tGlxTnH/WFdGLNOfyuAPjvpMa4+mgFw/
 z7BSCQl9pSXczURW2HWGesUEDCpYdvvF1fv8abaRtcdYf5F8DBv3d9XaAT+9BmJ6+Ty/h2SygCO
 C8nKgz1nvTaQ/Kwle0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91935-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06ED8F4340
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 02:01:01AM -0600, Aaron Kling wrote:
> On Thu, Jan 29, 2026 at 8:35 PM Aaron Kling <webgeek1234@gmail.com> wrote:
> >
> > On Thu, Jan 29, 2026 at 5:11 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
> > >
> > > On 1/28/2026 11:24 PM, Aaron Kling wrote:
> > > > On Wed, Jan 28, 2026 at 8:46 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> > > >>
> > > >> On Wed, Jan 28, 2026 at 12:54 AM Neil Armstrong
> > > >> <neil.armstrong@linaro.org> wrote:
> > > >>>
> > > >>> Hi,
> > > >>>
> > > >>> On 1/27/26 23:48, Aaron Kling wrote:
> > > >>>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
> > > >>>> for Android, using mainline kernel drivers. I have come across some
> > > >>>> missing functionality and failures that I would like to inquire about.
> > > >>>>
> > > >>>> * ABL fails to load a dtbo using a baseline dtb unmodified from
> > > >>>> mainline. Using changes described in the gunyah watchdog thread [0], a
> > > >>>> dtbo loads and the devices boot as expected. If any of the changes in
> > > >>>> that post don't exist in the base dtb, abl will fail to load the dtbo
> > > >>>> and go to the bootloader menu. This appears to be an issue in the
> > > >>>> baseline abl code, affecting all devices of that generation. Would it
> > > >>>> be allowable to merge a change adding those changes to the sm8550
> > > >>>> dtsi, allowing an unmodified mainline dtb to work with overlays?
> > > >>>
> > > >>> Any addition to the DT must be documented in dt-bindings, so if it's needed
> > > >>> for boot they should be documented and added for sure.
> > > >>>
> > > >>>>
> > > >>>> * SM8550 does not have cpu opp tables, thus cpufreq does not work. I
> > > >>>> have locally copied the commits from sm8650 and adapted for sm8550,
> > > >>>> and that seems to work okay. But no measuring of bandwidth was done,
> > > >>>> so the numbers are likely not entirely correct. Is there any plan to
> > > >>>> generate correct tables for sm8550?
> > > >>>
> > > >>> Cpufreq works but not the interconnect scaling, so doing the same as sm8650
> > > >>> is fine but since the values were calculated from downstream DT tables,
> > > >>> the same should be done for sm8550.
> > > >>>
> > > >>>>
> > > >>>> * As part of a series to support the original Odin 2, a patch to
> > > >>>> update sm8550 EAS values was submitted [1]. But that series stalled
> > > >>>> and this was never merged. If this change is valid, which per that
> > > >>>> discussion it appears to be, can it be resubmitted by itself and
> > > >>>> merged?
> > > >>>
> > > >>> I missed this patch, please re-submit, I also need to update the ones
> > > >>> for SM8650.
> > > >>>
> > > >>>>
> > > >>>> * Per the mainline kernel device trees and audio topology provide by
> > > >>>> the oem, these devices use primary i2s for the speakers path. There
> > > >>>> was a commit adding clock support for that as part of an hdmi series
> > > >>>> [2], but that seems to have stalled. Is this going to be picked back
> > > >>>> up?
> > > >>>
> > > >>> No, I do not plan to do this work, it required adding callbacks in the
> > > >>> code to handle the clocks like done for the pre-audioreach firmwares.
> > > >>>
> > > >>>>
> > > >>>> * Inline crypto fails to detect hwkm support. And I see other logs
> > > >>>> online, such as for the sm8550 qrd, that logs the same way my device
> > > >>>> does. I traced the issue to the check for wrapped key support [3]. On
> > > >>>> my devices, the derive call is supported, but the other three calls
> > > >>>> are not. I was pointed at the downstream headers for sm8550 support
> > > >>>> and only derive is listed there, the other three don't appear to be
> > > >>>> used in the downstream driver. Is this expected? And if so, will this
> > > >>>> case be added to the mainline drivers?
> > > >>>
> > > >>> Does hwkm work with you remove the last 3 calls ?
> > > >>>
> > > >>>>
> > > >>>> * Some gpu related clocks complain about being stuck off during boot,
> > > >>>> causing stack traces, but the gpu does work. I tried to do some
> > > >>>> research into this, but quickly got lost in the weeds and I have no
> > > >>>> idea where to even look.
> > > >>>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
> > > >>>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
> > > >>>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
> > > >>>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> > > >>>
> > > >>> This may be related with the display handoff from ABL, did you add the
> > > >>> plat region to the reserved memories ?
> > > >>>
> > > >>>>
> > > >>>> * Sometimes when starting rendering, a bandwidth submission times out,
> > > >>>> then the driver immediately complains that said id was left on the
> > > >>>> queue. I have tried increasing the timeout, but the same sequence
> > > >>>> still happens. Timeout happens, immediately followed by a matching
> > > >>>> unexpected response. Implying that this isn't actually a delay /
> > > >>>> timeout issue.
> > > >>>> [ 1848.517020] platform 3d6a000.gmu:
> > > >>>> [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message
> > > >>>> HFI_H2F_MSG_GX_BW_PERF_VOTE id 1015 timed out waiting for response
> > > >>>> [ 1848.518020] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg [msm]]
> > > >>>> *ERROR* Unexpected message id 1015 on the response queue
> > > >>>
> > > >>> Weird the timeout was extended for this very purpose
> > > >>>
> > > >>>>
> > > >>>> * Some 3dmark benchmarks such as solar bay cause a gpu crash. I am
> > > >>>> unsure if this is a kernel problem or userspace, so I'm submitting
> > > >>>> here first. If the consensus is that it's a userspace issue, I'll
> > > >>>> submit it to mesa.
> > > >>>> [ 1860.112008] adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu
> > > >>>> fault ring 2 fence a261 status 00EF0585 rb 06df/090f ib1
> > > >>>> 00000001512E9000/003d ib2 00000001512E7000/0000
> > > >>>> [ 1860.113122] msm_dpu ae01000.display-controller: [drm:recover_worker
> > > >>>> [msm]] *ERROR* 67.5.10.1: hangcheck recover!
> > > >>>> [ 1860.113238] msm_dpu ae01000.display-controller: [drm:recover_worker
> > > >>>> [msm]] *ERROR* 67.5.10.1: offending task: Thread-23
> > > >>>> (com.futuremark.dmandroid.application)
> > > >>>> [ 1860.258126] revision: 0 (67.5.10.1)
> > > >>>> [ 1860.258132] rb 0: fence:    2884/2884
> > > >>>> [ 1860.258133] rptr:     36
> > > >>>> [ 1860.258134] rb wptr:  36
> > > >>>> [ 1860.258135] rb 1: fence:    -256/-256
> > > >>>> [ 1860.258138] rptr:     0
> > > >>>> [ 1860.258138] rb wptr:  0
> > > >>>> [ 1860.258139] rb 2: fence:    41563/41569
> > > >>>> [ 1860.258140] rptr:     1752
> > > >>>> [ 1860.258140] rb wptr:  2319
> > > >>>> [ 1860.258141] rb 3: fence:    -256/-256
> > > >>>> [ 1860.258141] rptr:     0
> > > >>>> [ 1860.258142] rb wptr:  0
> > > >>>> [ 1860.258146] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG0: 0
> > > >>>> [ 1860.258220] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG1: 0
> > > >>>> [ 1860.258266] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > >>>> CP_SCRATCH_REG2: 41562
> > > >>>> [ 1860.258310] adreno 3d00000.gpu: [drm:a6xx_recover [msm]] CP_SCRATCH_REG3: 0
> > > >>>> [ 1860.258354] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > >>>> CP_SCRATCH_REG4: 3736059565
> > > >>>> [ 1860.258399] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > >>>> CP_SCRATCH_REG5: 3736059565
> > > >>>> [ 1860.258443] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > >>>> CP_SCRATCH_REG6: 3736059565
> > > >>>> [ 1860.258487] adreno 3d00000.gpu: [drm:a6xx_recover [msm]]
> > > >>>> CP_SCRATCH_REG7: 3736059565
> > > >>>
> > > >>> @rob do you have any idea how to solve this crash on a740 ?
> > > >>
> > > >> The clk and a6xx_hfi_wait_for_msg_interrupt errors indicate that
> > > >> something is unhappy about gpu pm.  I'd focus on that first, since
> > > >> that is almost certainly the cause of the later issues.  If things
> > > >> _sorta_ work (rendering UI, etc) you could try removing all but the
> > > >> lowest gpu OPP as an experiment.  Could be that power related problems
> > > >> surface when the GPU ramps up to higher OPPs.
> > > >
> > > > Things work amazingly well compared to what I was expecting. Using
> > > > mesa staging 26.0 as of yesterday, I'm getting roughly 80% performance
> > > > in the benchmarks that do run, compared to the stock Android. And
> > > > rendering is correct everywhere that I've seen so far. Mesa 25.3.3
> > > > gives about 89% compared to stock, but there are graphical glitches in
> > > > some of the benchmarks.
> > > >
> > > > I set gpu max_freq via devfreq to the minimum available frequency and
> > > > ran the failing benchmark again. It completed once, but failed with a
> > > > similar stack trace on the second run. And per sysfs, the gpu did stay
> > > > at that minimum. Of note, that causes the benchmark to fail, but
> > > > rendering does recover and the unit is still usable afterwards.
> > >
> > > In sm8550.dtsi, I see that ACD values are not specified in the GPU OPP
> > > table. Can we add those (from downstream dt) and try again?
> >
> > I don't know what I'm looking for in the downstream dt. But if such a
> > change gets pushed to lkml, I can grab that and verify.
> 
> I took at look at the downstream dt and took a guess at importing the
> acd values. I'm not sure if the gpu here is the baseline kalama or
> kalama v2. I guessed the former. There were a couple values missing
> however, that I had to extrapolate based on other frequencies. This
> however changed nothing about my test results. Still getting crashes.

Usually it's the latter. You can check it in /sys/kernel/debug/qcom_socinfo/raw_version

> 
> From my perspective, this part does not appear to be a PM or frequency
> related issue. Some of the 3dmark benchmarks I have never seen crash.
> Like Wild Life Extreme. I can run the stress variant of that and it
> beats the unit for 20 minutes at full clocks with a screaming fan and
> that runs perfectly stable. Solar Bay Extreme also runs completely
> stable in all of its glorious 3 fps. The two problems are the standard
> non-extreme Solar Bay and Steel Nomad Light. Both of these
> intermittently crash with similar traces to what I posted before.
> There doesn't seem to be consistency in the faults, sometimes it will
> be almost immediately after starting the benchmark, other times it
> will get 90% through and then fail. But they virtually always fail to
> complete. For another point of data, I have never seen GravityMark
> cause a fault either.
> 
> Aaron

-- 
With best wishes
Dmitry

