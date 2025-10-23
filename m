Return-Path: <linux-arm-msm+bounces-78422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50897BFECEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 03:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2EBF3A3019
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 01:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E19175BF;
	Thu, 23 Oct 2025 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFgYwbBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C1A1459FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761181526; cv=none; b=obHa8cObNy1TIXIWuC+3lKMPXmjHjljAnaQ321B1F1p9pI7wzPNWh1cGNpWXSYsUffdWKb+KDPIVCUVdhKJPluiRrWVBIIKMxEXfCO51f1esI6lFPsaUUP2aYcp9Z4drqcCvj/4DSIeGa80BfiFIkQ/NLPgEBntiZvjFtDIfK+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761181526; c=relaxed/simple;
	bh=D8Rsn+3O27naSZ1F+1O/6nJMxikIrng+VnbSFdOIVaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJdbPGS/N/98T2FzuPOgfg830KfbsPW79wDjWmoPC/6KLrBu8ziYEykV2evMmeLcuvfkP83f3x4cgEE+CNoIhQM155ZgILmZYJ5eISDD3a5aGh76ZfRcf4Qy2PSSlzPHn84TKe5tE+FMPWRtLTM3eu5ho7fk+sqaa6Aq+rS3rJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFgYwbBV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MJ1WOa011761
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5gOsJZ947HFVfypW6lOQ892XjE9ha/PZ0ypwwW1yIw=; b=pFgYwbBVwZFYiKhG
	n5UAX+ti2hDon0MDZG/91nT2UA5XNUFt4NA3V9oPa5cYQXJ1SHGyAPHozi+IDB2p
	H/UGU1R0P2CEVtuVB6SaYGuHJuTI6LxYXg8UAcOxHChBpqgxTv6qjxdgR14t2YXi
	1bgjSfS0u5f13vinS+81lLOwaxUayH1AgEeCNOfE7OC7bdKlkTNcuF5/BTLkUVRB
	29hx+ddL+KB+MW5+bHQJvRA4Vj67yvasV25pDctY60DZvWyMuIBjhURrj87EU9TY
	h8RxfXKuG17aC8j196K4IBU6nDOnRZ0lSQwZshJ/VArK+9l2d7UpQtWdlDoYzxEU
	VRHd2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5248q8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:05:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2924b3b9d47so2007845ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 18:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761181523; x=1761786323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5gOsJZ947HFVfypW6lOQ892XjE9ha/PZ0ypwwW1yIw=;
        b=S/kmMhMj+sAXPXifBWlWPVhO4WCQW/BbYoV0mnpyAFW4hKjdjuGCTonQb51EcmCC1Q
         jWfSiDTtIJFuioX7JwBlLIbkbWSb0SsdxE6IkaLrxKg9bFeYUPXwKsHA8JFVrxJiPoda
         E4U+PS8kEihAEyW2K0Whs7EMochUSF3jW7x2xFKNX2W/krUiWRoYylQxtz4yvpjnE29m
         4/cUUaNeeNNkJGIvpFIyJOVxXokM3xGgYmqvM1TMgclpuszDCwtCtvNc9N+iQ4XxLUoG
         WfljCNlwx9JzEaixj90GyXzvGBVu52cgDoks/BtTWdVa2lDVSJOtm+mtroMGRa3hoz1l
         CXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMYPKkc5LYfq2kQ0H/G5dBaKonFjRV+anHdOf3yQBnbXKKKrwuA838P/sWsm5EAG4u0GrNGIoto3Kqs6T1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MaLHN/HwXhxyNWPAbz0Oea3H+lusu8HCpuFJ78VlnrmD+rYS
	QoZqb5rsapdq01ufpel9YyF2jlfGzULcL4FJCIBss39vO2IKBub3FVWsK7SDPmSTbKEEhX7htsh
	n9qXIsZLjphh6vH8GGpUF+eVgFkZpKE1fykSKgJPMMewBRbUTeMc01ct/6POAJhengU/k75LD5p
	DECRpbWmshBhXkrq6d0M2douT8WDPNXxTjbk8Gzu8L/3o=
X-Gm-Gg: ASbGncucO3JlW9YKkNIFRZzHZS3HFeIwHK9ps1ESGQVIRmnXzn9sIrHIVnRqH6lZv6k
	6+uRBNAAJ6eiNJISYgiuK5t0w2hzp39qdCd4xU146fp2dDvXbdk9U6qwV6647pZ6aKmN63NUbG1
	OUaJ3mtwD/or8bFs3tCrIUBa3XH7SvtM7Rk2BEufLCaSdhL2ZVypTnRSLe
X-Received: by 2002:a17:902:ecc6:b0:274:3db8:e755 with SMTP id d9443c01a7336-290ca121230mr290776055ad.30.1761181522636;
        Wed, 22 Oct 2025 18:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES2PQOcMbYhjspE8hkEKpfz8CVvRLLN6L5GkKCTIJOoBWW7GJmAntRnlU28EB8fvMNIi7jBWlh/0YtBeraE2M=
X-Received: by 2002:a17:902:ecc6:b0:274:3db8:e755 with SMTP id
 d9443c01a7336-290ca121230mr290775615ad.30.1761181522132; Wed, 22 Oct 2025
 18:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-1-2c045af73dac@oss.qualcomm.com> <15c56c70-928a-4939-86a2-e7b81f1596a6@oss.qualcomm.com>
 <c239bce2-4bef-4085-8a74-c6d7c863febf@quicinc.com> <344f0f72-27c5-4b88-99ee-f71065cc3a5f@oss.qualcomm.com>
 <f2a46da9-23f1-425e-8978-0fa412ed1dfa@quicinc.com> <xfzzf3vebav3vhwe6n2vd6j2s3nhu2fgnoqkcalhrnhmi25wxw@zghvkcopsz54>
In-Reply-To: <xfzzf3vebav3vhwe6n2vd6j2s3nhu2fgnoqkcalhrnhmi25wxw@zghvkcopsz54>
From: Christopher Lew <christopher.lew@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:05:11 -0700
X-Gm-Features: AS18NWC2L8rBAMd4ZjOuNdnY91ces6GgffLzW6ix1oFLadpGUOhOJzR2MdlmlT0
Message-ID: <CAOdFzcigkaMF0vC6mGoJ4PKzPuJS2K=C8ghSjbfALAj+GvSTaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: smp2p: Add irqchip state support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <chris.lew@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX5JVZf9VXgi4A
 bwvKQ84heYRZLxXwl2v8kHmIbmwrrFYaRh8Jb5N04SDeDmWlQTrn0LonjmigFwHYY2pO/jh9lw2
 9TPkwgKGIzehCeNPYx+vnUJWKJwKW9zwRkZK2Ad64T069szGxAIjrdG/HVkACZFMJhHEL6f49HO
 j8nG6UcUlIfdof5ZjtgtIiFbYqzayYr8bBUC+be+0y4RoSTmWaUysPHEcQReg52y5Rc3rLiILVm
 HUHAGOV2p3PguhLxDdwfBcYMH3FqnJPmiPKQEKgrDodXhUpSDhwqTwkDH9WrYmYAo0a0olst0I6
 ueGikG61gQAm1AdTjga07v2yqGthJUO8Q2TSnkhk402RMGwpyYyjKAZ4V7McJqrEabR28NH0PZI
 6ktS17lSXjhUGfArQITW/bh+8VLZUg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68f97f53 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GCRby76-OpxP9vtlYsMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: DPBrdf0bjVJPlWvQrZlHxiWGX7juec2J
X-Proofpoint-ORIG-GUID: DPBrdf0bjVJPlWvQrZlHxiWGX7juec2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Wed, Oct 22, 2025 at 3:10=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Wed, Oct 22, 2025 at 04:27:28PM +0530, Deepak Kumar Singh wrote:
> >
> >
> > On 10/21/2025 3:05 PM, Konrad Dybcio wrote:
> > > On 10/21/25 10:12 AM, Deepak Kumar Singh wrote:
> > > >
> > > >
> > > > On 9/24/2025 8:20 PM, Konrad Dybcio wrote:
> > > > > On 9/24/25 6:18 AM, Jingyi Wang wrote:
> > > > > > From: Chris Lew <chris.lew@oss.qualcomm.com>
> > > > > >
> > > > > > A remoteproc booted during earlier boot stages such as UEFI or =
the
> > > > > > bootloader, may need to be attached to without restarting the r=
emoteproc
> > > > > > hardware. To do this the remoteproc will need to check the read=
y and
> > > > > > handover states in smp2p without an interrupt notification.
> > > > > >
> > > > > > Add support for the .irq_get_irqchip_state callback so remotepr=
oc can
> > > > > > read the current state of the fatal, ready and handover bits.
> > > > > >
> > > > > > Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> > > > > > Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > > > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > > > > ---
> > > > > >    drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++=
++++++++++++++++++
> > > > > >    1 file changed, 55 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.=
c
> > > > > > index cb515c2340c1..e2cfd9ec8875 100644
> > > > > > --- a/drivers/soc/qcom/smp2p.c
> > > > > > +++ b/drivers/soc/qcom/smp2p.c
> > > > > > @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qc=
om_smp2p *smp2p)
> > > > > >        }
> > > > > >    }
> > > > > >    +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> > > > > > +{
> > > > > > +    unsigned int smem_id =3D smp2p->smem_items[SMP2P_INBOUND];
> > > > > > +    unsigned int pid =3D smp2p->remote_pid;
> > > > > > +    char buf[SMP2P_MAX_ENTRY_NAME];
> > > > > > +    struct smp2p_smem_item *in;
> > > > > > +    struct smp2p_entry *entry;
> > > > > > +    size_t size;
> > > > > > +    int i;
> > > > > > +
> > > > > > +    in =3D qcom_smem_get(pid, smem_id, &size);
> > > > > > +    if (IS_ERR(in))
> > > > > > +        return;
> > > > > > +
> > > > > > +    smp2p->in =3D in;
> > > > > > +
> > > > > > +    /* Check if version is initialized and set to v2 */
> > > > > > +    if (in->version =3D=3D 0)
> > > > > > +        return;
> > > > >
> > > > > This doesn't seem to be fully in line with the comment
> > > > >
> > > > > Konrad
> > > > >
> > > > Hi Konard,
> > > >
> > > > Can you please elaborate more on this?
> > > > in->version =3D=3D 0 means remote has not initialized the version y=
et, so no need of enumerating entries. For other case i.e in->version =3D=
=3D 1 or 2, in entries added by early booted remote has to be enumerated.
> > >
> > > It's not at all obvious that 0 is supposed to mean "uninitialized"
> > >
> > > Please #define it
> > >
> > > Konrad
> > I think that can be added or instead we can replace (in->version =3D=3D=
 0 )with
> > (in->version !=3D SMP2P_VERSION_2).
> >
>
> I agree with Konrad regarding the discrepancy between comment and code,
> "Initialized and set to 2" means specifically version 2, while checking
> against 0 means "any of the remaining 255 possible values.
>
> I don't think we need a define for the version number 2.
>
>
> But we most definitely need a comment about why the remainder shouldn't
> be executed for all other (initialized) versions. Today, specifically,
> why isn't this code valid for version 1?
>

I think I had made an assumption that the processors still supporting
V1 were remoteproc managed processors, for those processors this check
would always return early because those remoteprocs boot after smp2p
probes.
If this code somehow executed on a v1 edge, then we would most likely
miss some notifications. That's abnormal behavior so let's change the
check to explicitly look for 2.

Thanks,
Chris

> Regards,
> Bjorn

