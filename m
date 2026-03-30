Return-Path: <linux-arm-msm+bounces-100771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ1cAvNdymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:26:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 272EF35A39F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17706302F4F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C0537BE64;
	Mon, 30 Mar 2026 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxVd3d57";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpKHTsSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8B3C6A39
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869144; cv=none; b=LyY0/kgjlMeN5ajCVpMI5jBjEPxfEa2k+oa6DmeWQdt1sAhIDoncxYaTPLgOnoQfozCQd7lZo5knsCrRB/LpMGTrzLYUjIg0nVPNt2H3QDeSlklfh8fVnyPmzb53HVeTkY5A/PltXpoEGH3hnCIZ9D7Gsbams+iIdYq/vn6jNNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869144; c=relaxed/simple;
	bh=yKQ2hqm3ssSz7i7J3BT+5SKqNI3XbWoW61M9dqwrWHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Za5niHvpeqL5Ub43Hhx6kgb2uXoxPCpT7jpsd1mF1XNZjnkvxNXAsQ0oaKdcMvQd2AzlVv3zGEQovMDMTkEtFDvf9gQW5Az4cDVkGz/rSlQtfuWOO1MtIYp5puFGVSdUTCmVyOoZxVSAim3EvgGHaHgG0nykH7hwFBG87VpVAT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxVd3d57; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LpKHTsSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UA7k1B3539676
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uaIYxigzF8yli1f4yYSfdFtRdIod3eZhOhMMNkGtz0=; b=VxVd3d57qCnqku7B
	bova6/8hlATk+oDiyZ63Dwmh2AYjeVG1wOspOaqZuJPLbTmLDjajEOwGXvcwGcM6
	G0rukpm4EObIKTxWLeSNBu2N6bqgGUD4ekh+T/7owG9BTz691X5923E787FIpF0+
	yVkAQHQgkLe5Vr0Xp1NFusSBbXPopY9A4HF+NSugT6OkFcILKxztud76D/mAZTyi
	D6UF26ujt2bECM13MTpAiSeLvB1L/r1pEFyq0JB8MUU8wKJ/JoP7sRRlQfxs9RSg
	4bvr/HN4EZ6ekHTtYqxfGDBOl7X9HwHIiU4kn/4+wWe/uN5ytFj6EOkGSsA+Uti0
	BOPDuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59r7af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:12:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so142566111cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774869137; x=1775473937; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uaIYxigzF8yli1f4yYSfdFtRdIod3eZhOhMMNkGtz0=;
        b=LpKHTsSytyMNIkgrXTJpCV9rGC2QJUtQ0XKoAhlZ5aJFA8OWYGluDL33+sTxtBQwpu
         ag7uGVzw8oKFpjLOaXx2/uh0/xeOkfJZQtvftHVRzbkddfrVEYpBxeJmMMN1e0yPjcKS
         Srq7yN79A9fuyG7S2+4osc73JdAl8RnWkUFuEUyrL8DrR14YU6L6MTfLn7DQQ0hVNl55
         jQNch9UsZnXVw814QnVi2Wa0kW/nEx93jLoq3WP1lkZjZ5vg2bAL8JVH+A4PH+3jqcLZ
         n1hiF0ZQmoPJZfEDKZW+K/DjYnFhMUrDesOScfpZ2Im2PhvnfNQwDxM/pYWex3k5SFHh
         p+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774869137; x=1775473937;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uaIYxigzF8yli1f4yYSfdFtRdIod3eZhOhMMNkGtz0=;
        b=r+DStOWugZ8hsc2YIdB4dypelSj6bippdP2fcfwElqaz7z3//ovTjAbPLhrl9vF297
         U8NLysPyATgwQfHYMfYcjq2V+6RN0+nRq8hvon3MrmDex+J8He0lHnZdL6qBPfPHVEpp
         GVnUV6Awcbu16fc6bRYSjRg4MpbR6Vvn21jEO3kC5+Ynw1Gtd66Lo6UdGAgyQO4SHNpj
         mJBTAaPWV3g5WHEMYlHgTEQ+N8nz289W0UJm91ev3PM/7FhPSSOWRTGPfuRpetBAhLOT
         A0YJSTX7ae0XlNWbNu7BGb3AgMHoE9Ha6rK5OreOV/4lfwFkMz7f9GAVHkceMEdOZZgm
         PbmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDbA9QiuzQQOZ5Zd0UlZyaPVaelbqKXcWCGo8t7U4ctzYN2BHsKz45bjaVqz0rH8eVmdPjP9od37Ftem+F@vger.kernel.org
X-Gm-Message-State: AOJu0YwYou/A3UXDG7x34yCgFXeT6+PNX7GZ1Ffg+G1N9udVjsUyJI2t
	6LjkGV5iz9rIiaj03R15iNZWkrVXj72WMbVeRKmsEq8848jzBSjzuCBJcjSiLKHW1e5ZJnvSDoU
	y/sM9mGUa8AM94bJ/Uz7X71i8mEUXgAEIlhHW6xuObG806UVcLoACRg7jbHSuYKP9/s0KkFWm5u
	lf
X-Gm-Gg: ATEYQzyTTYtq1L6crTD8WUJhcgq3+x30ehuQQDBfrmTKjV9tVrUZPXhziE2mjfY5nmX
	RAtIUE08whw9rZOqVjGbpmi7j/Q29zr9jCD45CGL41cK6epQzrUZYCIBUSqWIrbu6Fg+lWPG5ub
	WgENevPbTpPNqpXPMEYJSD7pbnPDlm5dd/ZtbLl3c1waEeh/VftkFiI86TMxIJiJpHDGMe6C64Q
	sNHX7YnT4i2np3pTvyoFys0eMp95TKEJ7bKQwS7742IEciEJ6lxDuJrIG8PJxbzBHrvBzpLR9Uv
	4t6TwcVOKwCZ7Gs7etaXh7Ah5UYMjqc6MO/d8YHT+A2smBXFWhii0WZHWztH/+x/7cE/rFPtuM8
	zrBxV5iXqmVOZOeVXy3Wgt86S2euPm5Q1i0fIBELmYYRIwe5W/AgtgAOJ6VfowD1DXYDWKKQN8w
	/wUdaqg0vKF/p8STx3lRx5KJ0Fz2TdY9rIG5s=
X-Received: by 2002:ac8:7f8f:0:b0:50b:50bf:5bd0 with SMTP id d75a77b69052e-50ba380a85emr160793281cf.8.1774869136842;
        Mon, 30 Mar 2026 04:12:16 -0700 (PDT)
X-Received: by 2002:ac8:7f8f:0:b0:50b:50bf:5bd0 with SMTP id d75a77b69052e-50ba380a85emr160792991cf.8.1774869136357;
        Mon, 30 Mar 2026 04:12:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd743sm1584807e87.21.2026.03.30.04.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:12:14 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] soc: qcom: cmd-db: fix minor version decoding in debugfs
 output
Message-ID: <pidmpblrthjfrxczagvhwrofv7cbicfpk4gf5ku4qytbudty7g@mztg76bhrty3>
References: <20260329191110.1476304-1-alok.a.tiwari@oracle.com>
 <eed2185e-1754-4e5a-8a19-36b9f968c03a@oss.qualcomm.com>
 <bdaccf73-d7aa-489a-b0fe-94ea2d1d2a83@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdaccf73-d7aa-489a-b0fe-94ea2d1d2a83@oracle.com>
X-Proofpoint-ORIG-GUID: osrmRlGShxx7-ot_NGPSt-jxS9XpwimI
X-Proofpoint-GUID: osrmRlGShxx7-ot_NGPSt-jxS9XpwimI
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69ca5a92 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=yPCof4ZbAAAA:8
 a=BtHtGCnKdHITBYuKA6AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4OCBTYWx0ZWRfX+jOEkFtptzc7
 Z+E0FbEmcAL3lrMuoCPqGlmtcvjZLfYvsZ+A3aJM7otYlgY1VYjr1DBTtEGGspNL2DEGmmJ86nY
 V7LywVRvUhqYj6uqymcmE1oOqlMs/f34r7LqMRT4l7Y+AAXL2fO+rmY6qMKawrOJg2eR6HN5JvF
 FTyX0WG2Q5cg7M13MGtzUpKozjYQZOEz9oo5reTipipCNm2/wJ/3EYIHoQr/crsX01woCbgYz5u
 GmGu2Slic2S1i7mIPBVu1kCtNxs+pwS+fLrnFjULlRLjNfOyAK4ZlYUd3IZayXtOh+iXhi/Rikc
 wzhxNVmjoodiMZ1vvXiAkWYCHevqL5P2pVs/fH4uz5FsNGa/CTrkAnbFCfNP5lDc0JwVb8dNM/g
 +x1DiZdFPl+Z9EKZ2VngP+m3ZgFyv1YPQH/gjX+Nxka8k6GdxJI0qu1Wz9U/tSosP9zPbwPcByc
 Jmx2bFn+HH1O/X5b8tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300088
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100771-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oracle.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 272EF35A39F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:33:13AM +0530, ALOK TIWARI wrote:
> 
> 
> On 3/30/2026 11:05 AM, Sneh Mankad wrote:
> > > cmd-db encodes the version as major in the high byte and minor in the low
> > > byte. cmd_db_debugfs_dump() prints the full 16 bit value as the minor
> > > version, resulting in incorrect output.
> > > 
> > > Extract minor from the low byte using (version & 0xff).
> > > 
> > > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > There should be a "fixes:" tag added since this is a fix.
> > > ---
> > >   drivers/soc/qcom/cmd-db.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> > > index 84a75d8c4b70..eed7013c7676 100644
> > > --- a/drivers/soc/qcom/cmd-db.c
> > > +++ b/drivers/soc/qcom/cmd-db.c
> > > @@ -301,7 +301,7 @@ static int cmd_db_debugfs_dump(struct seq_file
> > > *seq, void *p)
> > >           version = le16_to_cpu(rsc->version);
> > >           major = version >> 8;
> > > -        minor = version;
> > > +        minor = version & 0xff;
> > 
> > Minor is already a u8 type, so assigning a u16 type version to u8 type
> > will automatically truncate the higher 8 bits.
> > 
> > Its the same reason why version is right shifted by 8 before being
> > assigned to major variable.
> > 
> > I do not think there would be any difference in output with or without
> > the change, do you have any example?
> 
> 
> Thanks for pointing this out.
> 
> You are right that if minor is of type u8, assigning a u16 value will
> implicitly truncate the upper 8 bits.
> 
> However, the intention of the change is to explicitly extract the minor
> version from the lower byte, since the encoding defines the version as major
> in the high byte and minor in the low byte.
> 
> Using version & 0xff makes the extraction explicit and consistent with how
> major is derived using version >> 8. It improves readability and avoids
> relying on implicit truncation.
> 
> Since this change does not alter functionality and is mainly for clarity and
> consistency I believe a Fixes: tag may not be appropriate.
> I can also drop “fix” from the subject to avoid confusion.

I believe the whole patch is unnecessary, sorry. It's handled by the
compiler itself.

-- 
With best wishes
Dmitry

