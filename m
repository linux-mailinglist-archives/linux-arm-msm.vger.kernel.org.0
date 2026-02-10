Return-Path: <linux-arm-msm+bounces-92403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAK9GNG6imlmNQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 05:57:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B04A6116EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 05:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE5F63013A8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95AED329C79;
	Tue, 10 Feb 2026 04:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NifceJas";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuvvWt9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715726ED3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770699464; cv=pass; b=Og+hP8XMRzT6k6RjikC02Twxf7LkGJCVvNwc5sLo4rvjfZkCqPHHcGdobwqDRT7Uq3yh+zPjK1HjAwlf9VpzgY/2OnWPf6IjKiAtLlvbHVkIg00iQ25UMX8vOGA4lB7iEegs2IgVUDEzJmtCiutBlonYIOXA/Up5+mxZKiM0HSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770699464; c=relaxed/simple;
	bh=mvRCNCDWnnyTl7hSDZjHxriAP6B18Za3FG0XAiIQ0/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BMz1HU+uaxlxLL96VMQrYex40a0OAVG1HYMEUn/gYJGyoyycqfws2fG8Wzh7SdkKBK9nCTjNqYVzDH7t2UPvBChxUwFUyR/s+M8QipUwDuifmBTCXZsaTFhkF2qY9tw5OK0oWojVPIPGYuatpOiEr/qmTwZsyhG2DCkV+w+83eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NifceJas; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuvvWt9H; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A2OPH01231822
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/VnniC6/jkG+UbrSHCb3Fqlsu2pmu+Q7rIfJiTi0IE=; b=NifceJasvrVhWia8
	/eVoda4vIk5jSqj1qYtsEKR9EUeOqgn6VYRplDMClN6R4oVW+OKVRaAvaA5ovNYQ
	8hQbIq+etgln8bUGvQzAnGxnZxzaBpCcPyklVFT6L+T9UTUIIUB1JKaWZ14AVBbO
	c7jiUAzvmfDCCpaWtuNUqCTn/tLZvGxEuGgad3ykBEBzUinE3d5ao2spZPlE0MrC
	YdYeWpVoD6uqQ95sOU3TPnjX1POqWfIt64L0LrVIqSt7qW3/iJMI09DZ1ET6qEwG
	3ZT4Br8OwYWGHjydfrdduarPqg+ipW/ItcCogS64SWCQEqMVXsH+1XbMjj9OU4Va
	XSxkWw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv58ccv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:57:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba87c0e198so367447eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 20:57:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770699461; cv=none;
        d=google.com; s=arc-20240605;
        b=Ubb4p/g7qDkGefEcfcifoOIkZzhmhJ5mK7xIBpKEQFol2o40VYG9p3qN36fVk3tvtY
         tUsOEsFbI7XO2pe7t7t7wtJ9pn5nX5JuTLJtU62jxgmmqPD42lJDv/bWXBFrX+s6QFzS
         o0vbw/n1UVZOdv136N5HILu6quBotIJQOd8y233rsr+FSDPUgWv3aHvMcnCPnXIQtRCr
         sCVqBnbmGi/KyjPJIhwLlt/JupKEycORmd2uaPs3wuN0ivuV7zyS6xxOgwzLKhtJwBhx
         8xKJCkSHimuBcTjoEcM8eW+wmwWZVd2BcblbhAZW0NeU/PfC3cl+Lw4oKzz/oZ8VBKs3
         ScbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q/VnniC6/jkG+UbrSHCb3Fqlsu2pmu+Q7rIfJiTi0IE=;
        fh=UYgG86K6CBJrxlVWZi+JrxC8uv9rursjniSw/9Y0xu4=;
        b=RzaSopzGDTpVKOxeeftIMJXin8Rej7+sYdvp35iqUWootFPfdGaaPiRJil6QcxqkAR
         /YbJueBx/t79Bqn0ThSryWIvA2o+vJZnoCD1MuFfXNaWVE3TrTZaxHP/5HWG1leU4mss
         cmYntCSMXb1UyBqfD4+gKyoUW8w4IVYMHX6b62GZihjoU9DpitISIP/Ktb5T2VCahnw5
         +C3pEV0TN4/hYZfFnQDkqnnKHEyQNTy2MDLo+TeintMULSUqZ2kZTmjAVIUrOVH7Ph80
         jmQMktDB2wrYpeWi9M0TU0FVqRbcB/93Cz5bwWcPh7/DMW8ZYE+8yjNL7bz+vtnKHNQd
         57mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770699461; x=1771304261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/VnniC6/jkG+UbrSHCb3Fqlsu2pmu+Q7rIfJiTi0IE=;
        b=JuvvWt9HeojyR9sCCiyvssZui1ZYUNVw21D9vnSTAOKh+4RMZYCmm9i/Pl5qL1XnTv
         0FKKwGTCBmmTnIJ2Le6u9NLf8fUuDyDPAzy6GpNIxm/ts7f1FdVC7c+SrWFtjLCYvyVW
         DCxLxC04t7OG0Vo4VrBFbQYbfP4ztLrIJU562et2fc81kys4z+5MAhEZ1dLarMa4bKIj
         1p2IDMGMIqqvDnbEez5KeC6yhus9X2DhXuaIQ+C5b4A5gobl2p4bfJenWqlxqTLpUYFU
         6Grycgb2tJRnON6b97WT8quz0f753C8SPOhdvOoUpSECzb99GLn2Z0wPC4yRy7eun5eK
         zhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770699461; x=1771304261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q/VnniC6/jkG+UbrSHCb3Fqlsu2pmu+Q7rIfJiTi0IE=;
        b=pWEYbGsEioOUQQv859sqqHD7+zXsXVI08QYh5Ef6wdH+abQOSQwpm7mxe34x8y8EtI
         5StxZBHd6eaKdRPDGJezn0AxlLYPnHy7rTp2m5v1PAFVl1yPrx1nUknWU13m3W2nOvUz
         HumFOmoZuDEWi0Fym34toCC8y8qWvPjeRxjYSIeodimG+QQzKn1h0FhF0djZAwhZRiQT
         D1R+5qe4SRIrr7K+woY8jNDEOGcKaFoE2EKP1WM4GWlHDVN1JJZs/zlxMqmpg1O2kLlw
         XchBQRra0g4wUXYYHayf27/yX+GPqxBJhfRxGyf1KCa7m6oj22+bguLZmkLaTLGU3U6g
         bzEA==
X-Forwarded-Encrypted: i=1; AJvYcCVqfYk+1jjSXV0M1H1l0Qtk8NxdgUFCHDLBDs9fzczFiidtDkZOo/lu9kC+dVWVBIp+hJdq4bacVbBOovjZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxma9/NfQkJ+eQqiH2eVh/9xYwG1jnfkWZwEAKlcsX75G7AZONK
	bHF+aTvk6NW/71iwaySOUL5ODpHCR+DRAf9ZFn3eteoiqDM+5N8R1yLVx+/u6KVZdHL2HI1sbz5
	PqoliidGZtwiN4Y4JNNybaQW08Jlrzt/i2l6YPdldo+gcVS3MNEOSX1Z2W1wmMNrCwdEvh/vIIJ
	YN9/gqYubYorTl1FqsPH9vuhSu2G29bp8v5pwhDdznvdU=
X-Gm-Gg: AZuq6aJcR8y/doPmFTP8DuYEiryGgF1VLzuI21NgxGERoYW6Mta024Ut08pMHpOTs3a
	ZFKduwBYkDAJM+mdQmcbohZoV6FF28muuzxbb0RL0NV1l8oxB2yDcX4gOsPFL9zB7PH2Qe3/1AA
	4O0vZrnTaH8BbfTxEYbGSUhKbCrnMIZ+o0lk+MjTRCNlOXjjXubzF18HH2+sCYFMxY1t9S4VkSs
	jrFbqxH
X-Received: by 2002:a05:7301:3f16:b0:2ba:6458:b320 with SMTP id 5a478bee46e88-2ba8a64ad8cmr478985eec.7.1770699460544;
        Mon, 09 Feb 2026 20:57:40 -0800 (PST)
X-Received: by 2002:a05:7301:3f16:b0:2ba:6458:b320 with SMTP id
 5a478bee46e88-2ba8a64ad8cmr478971eec.7.1770699459827; Mon, 09 Feb 2026
 20:57:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
 <CAGptzHOfmrHeJWvMxWj_xUTt_Xn-WGX04oc5s7DvjujPUOWQZQ@mail.gmail.com> <bznckulswclw6zwaf4r524hxsimz3d2p4rk5lrnvlcgpyxqlru@nenunn2h7fjz>
In-Reply-To: <bznckulswclw6zwaf4r524hxsimz3d2p4rk5lrnvlcgpyxqlru@nenunn2h7fjz>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:27:28 +0530
X-Gm-Features: AZwV_Qj31EA1wabXFQjs_IM7u4yQr0FvN8fdYwxlE2tfWRzXNB0WGy6hWsS7ai0
Message-ID: <CAGptzHOTi=ysnYS_nXhn-m+hC969LW2tdCnU5P-y5sKaxt6MMg@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and expose
 as a pure library
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAzOSBTYWx0ZWRfXylxq7hD/+hym
 zqoTgALvyNq9AWxTuBCdOwa5Vu5sNSsuo2Xt6xI/kRuKqIYXRxdqDQobUib4yYVpiEx5UDmqhy/
 8wnCnLO10X/hR1lB9vpii04FTenPlRkpfECfDLeXE9vMLQ2VvVQ+ISGRwmbmn2W44Hht7hLFcln
 YgLY/Tb1d2QOQb/lq/OW5ma9pVMR0VBAH/NI1VQEM1/Zr0lsrlnthQk9PTV+ty7yzuPMVBQfKUL
 7xQpnO4HO0WD4TSIEegcnyVU930PBiQD3cTrUzL1MrSxmR3NZBaoP18pElfKpW0Pg7ql8ZqzNYl
 5A/GvHIlU0DUTzhoxWWhSMbAkClFdBqXx/sDVvbnCsBAL2ax3xp5pDAVoxfy7lbPxamL/R0hVuX
 oi5s8A46xwMG5BWGcSZYG0GNk8YFinZzqUGRYWPth5wjd39ONPCZzEU5YMjlVkQ6f37fCrHsEYX
 3QtnSym/sdRTmBL3xzw==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698abac5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PRTK_1lWvyV9fVIPR8EA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: DV880RuEmi2JtHw66HGOpb7iI7EZOGC1
X-Proofpoint-GUID: DV880RuEmi2JtHw66HGOpb7iI7EZOGC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100039
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92403-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: B04A6116EE8
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 6:27=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Mon, Feb 09, 2026 at 06:12:35PM +0530, Sumit Garg wrote:
> > Hi Mani,
> >
> > On Tue, Feb 3, 2026 at 1:37=E2=80=AFPM Manivannan Sadhasivam
> > <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> > >
> > > The current platform driver design causes probe ordering races with c=
lients
> > > (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE pro=
be
> > > fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops=
 with
> > > -EPROBE_DEFER, leaving clients non-functional even when ICE should be
> > > gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE dr=
iver
> > > probe has failed due to above reasons or it is waiting for the SCM dr=
iver.
> > >
> > > Moreover, there is no devlink dependency between ICE and client drive=
rs
> > > as 'qcom,ice' is not considered as a DT 'supplier'. So the client dri=
vers
> > > have no idea of when the ICE driver is going to probe.
> > >
> > > To avoid all this hassle, remove the platform driver support altogeth=
er and
> > > just expose the ICE driver as a pure library to client drivers. With =
this
> > > design, when devm_of_qcom_ice_get() is called, it will check if the I=
CE
> > > instance is available or not. If not, it will create one based on the=
 ICE
> > > DT node, increase the refcount and return the handle. When the next c=
lient
> > > calls the API again, the ICE instance would be available. So this fun=
ction
> > > will just increment the refcount and return the instance.
> > >
> > > Finally, when the client devices get destroyed, refcount will be
> > > decremented and finally the cleanup will happen once all clients are
> > > destroyed.
> > >
> > > For the clients using the old DT binding of providing the separate 'i=
ce'
> > > register range in their node, this change has no impact.
> > >
> > > Cc: stable@vger.kernel.org
> > > Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a ded=
icated driver")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualc=
omm.com>
> > > ---
> > >  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-----------------------=
--
> > >  1 file changed, 39 insertions(+), 61 deletions(-)
> > >
> >
> > Thanks for this change but we need to avoid building ICE as a module
> > too and return error code when ICE SCM calls aren't present.
> >
>
> Why built-in?

If the intention is to build it as a module then you don't drop following:

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 139891a122db..bfe23cb232fc 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -729,3 +729,6 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device *de=
v)
        return ice;
 }
 EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
+
+MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
+MODULE_LICENSE("GPL");

-Sumit

>
> > So following diff on top of this patch works for me, feel free to
> > incorporate it in your patch:
> >
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 2caadbbcf830..db528104488b 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -283,7 +283,7 @@ config QCOM_ICC_BWMON
> >           memory throughput even with lower CPU frequencies.
> >
> >  config QCOM_INLINE_CRYPTO_ENGINE
> > -       tristate
> > +       bool
> >         select QCOM_SCM
> >
> >  config QCOM_PBS
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index 8640e05becd1..139891a122db 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -563,7 +563,7 @@ static struct qcom_ice *qcom_ice_create(struct devi=
ce *dev,
> >
> >         if (!qcom_scm_ice_available()) {
> >                 dev_warn(dev, "ICE SCM interface not found\n");
> > -               return NULL;
> > +               return ERR_PTR(-EOPNOTSUPP);
>
> This makes sense.
>
> - Mani
>
> >         }
> >
> >         engine =3D devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
> >
> > -Sumit
> >
> > > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > > index b203bc685cad..b5a9cf8de6e4 100644
> > > --- a/drivers/soc/qcom/ice.c
> > > +++ b/drivers/soc/qcom/ice.c
> > > @@ -107,12 +107,16 @@ struct qcom_ice {
> > >         struct device *dev;
> > >         void __iomem *base;
> > >
> > > +       struct kref refcount;
> > >         struct clk *core_clk;
> > >         bool use_hwkm;
> > >         bool hwkm_init_complete;
> > >         u8 hwkm_version;
> > >  };
> > >
> > > +static DEFINE_MUTEX(ice_mutex);
> > > +struct qcom_ice *ice_handle;
> > > +
> > >  static bool qcom_ice_check_supported(struct qcom_ice *ice)
> > >  {
> > >         u32 regval =3D qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> > > @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct de=
vice *dev,
> > >   * This function will provide an ICE instance either by creating one=
 for the
> > >   * consumer device if its DT node provides the 'ice' reg range and t=
he 'ice'
> > >   * clock (for legacy DT style). On the other hand, if consumer provi=
des a
> > > - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance wi=
ll already
> > > - * be created and so this function will return that instead.
> > > + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE i=
nstance will
> > > + * be created if not already done and will be returned.
> > >   *
> > >   * Return: ICE pointer on success, NULL if there is no ICE data prov=
ided by the
> > >   * consumer or ERR_PTR() on error.
> > > @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct =
device *dev)
> > >         struct qcom_ice *ice;
> > >         struct resource *res;
> > >         void __iomem *base;
> > > -       struct device_link *link;
> > >
> > >         if (!dev || !dev->of_node)
> > >                 return ERR_PTR(-ENODEV);
> > >
> > > +       guard(mutex)(&ice_mutex);
> > > +
> > >         /*
> > >          * In order to support legacy style devicetree bindings, we n=
eed
> > >          * to create the ICE instance using the consumer device and t=
he reg
> > > @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct d=
evice *dev)
> > >                 return qcom_ice_create(&pdev->dev, base);
> > >         }
> > >
> > > +       /*
> > > +        * If the ICE node has been initialized already, just increas=
e the
> > > +        * refcount and return the handle.
> > > +        */
> > > +       if (ice_handle) {
> > > +               kref_get(&ice_handle->refcount);
> > > +
> > > +               return ice_handle;
> > > +       }
> > > +
> > >         /*
> > >          * If the consumer node does not provider an 'ice' reg range
> > >          * (legacy DT binding), then it must at least provide a phand=
le
> > > @@ -643,41 +658,43 @@ static struct qcom_ice *of_qcom_ice_get(struct =
device *dev)
> > >
> > >         pdev =3D of_find_device_by_node(node);
> > >         if (!pdev) {
> > > -               dev_err(dev, "Cannot find device node %s\n", node->na=
me);
> > > +               dev_err(dev, "Cannot find ICE platform device\n");
> > > +               platform_device_put(pdev);
> > >                 return ERR_PTR(-EPROBE_DEFER);
> > >         }
> > >
> > > -       ice =3D platform_get_drvdata(pdev);
> > > -       if (!ice) {
> > > -               dev_err(dev, "Cannot get ice instance from %s\n",
> > > -                       dev_name(&pdev->dev));
> > > +       base =3D devm_platform_ioremap_resource(pdev, 0);
> > > +       if (IS_ERR(base)) {
> > > +               dev_warn(&pdev->dev, "ICE registers not found\n");
> > >                 platform_device_put(pdev);
> > > -               return ERR_PTR(-EPROBE_DEFER);
> > > +               return base;
> > >         }
> > >
> > > -       link =3D device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_=
SUPPLIER);
> > > -       if (!link) {
> > > -               dev_err(&pdev->dev,
> > > -                       "Failed to create device link to consumer %s\=
n",
> > > -                       dev_name(dev));
> > > +       ice =3D qcom_ice_create(&pdev->dev, base);
> > > +       if (IS_ERR(ice)) {
> > >                 platform_device_put(pdev);
> > > -               ice =3D ERR_PTR(-EINVAL);
> > > +               return ice_handle;
> > >         }
> > >
> > > -       return ice;
> > > +       ice_handle =3D ice;
> > > +       kref_init(&ice_handle->refcount);
> > > +
> > > +       return ice_handle;
> > >  }
> > >
> > > -static void qcom_ice_put(const struct qcom_ice *ice)
> > > +static void qcom_ice_put(struct kref *kref)
> > >  {
> > > -       struct platform_device *pdev =3D to_platform_device(ice->dev)=
;
> > > -
> > > -       if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"=
))
> > > -               platform_device_put(pdev);
> > > +       platform_device_put(to_platform_device(ice_handle->dev));
> > > +       ice_handle =3D NULL;
> > >  }
> > >
> > >  static void devm_of_qcom_ice_put(struct device *dev, void *res)
> > >  {
> > > -       qcom_ice_put(*(struct qcom_ice **)res);
> > > +       const struct qcom_ice *ice =3D *(struct qcom_ice **)res;
> > > +       struct platform_device *pdev =3D to_platform_device(ice->dev)=
;
> > > +
> > > +       if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"=
))
> > > +               kref_put(&ice_handle->refcount, qcom_ice_put);
> > >  }
> > >
> > >  /**
> > > @@ -713,42 +730,3 @@ struct qcom_ice *devm_of_qcom_ice_get(struct dev=
ice *dev)
> > >         return ice;
> > >  }
> > >  EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
> > > -
> > > -static int qcom_ice_probe(struct platform_device *pdev)
> > > -{
> > > -       struct qcom_ice *engine;
> > > -       void __iomem *base;
> > > -
> > > -       base =3D devm_platform_ioremap_resource(pdev, 0);
> > > -       if (IS_ERR(base)) {
> > > -               dev_warn(&pdev->dev, "ICE registers not found\n");
> > > -               return PTR_ERR(base);
> > > -       }
> > > -
> > > -       engine =3D qcom_ice_create(&pdev->dev, base);
> > > -       if (IS_ERR(engine))
> > > -               return PTR_ERR(engine);
> > > -
> > > -       platform_set_drvdata(pdev, engine);
> > > -
> > > -       return 0;
> > > -}
> > > -
> > > -static const struct of_device_id qcom_ice_of_match_table[] =3D {
> > > -       { .compatible =3D "qcom,inline-crypto-engine" },
> > > -       { },
> > > -};
> > > -MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
> > > -
> > > -static struct platform_driver qcom_ice_driver =3D {
> > > -       .probe  =3D qcom_ice_probe,
> > > -       .driver =3D {
> > > -               .name =3D "qcom-ice",
> > > -               .of_match_table =3D qcom_ice_of_match_table,
> > > -       },
> > > -};
> > > -
> > > -module_platform_driver(qcom_ice_driver);
> > > -
> > > -MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
> > > -MODULE_LICENSE("GPL");
> > > --
> > > 2.51.0
> > >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

