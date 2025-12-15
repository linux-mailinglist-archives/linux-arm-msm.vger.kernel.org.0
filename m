Return-Path: <linux-arm-msm+bounces-85272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD565CBFAB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 21:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE74230B0A56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709BC33AD93;
	Mon, 15 Dec 2025 19:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUHvNFsJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNzvB+wa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6630533ADAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827873; cv=none; b=h9VX0h3Usf9AWYXBHt6odPz3TRPp39kL6Emrx9TgcN50FjjanKcGILpYdvY8AdqqQ6FgsUThuUkp8OOydHK446b9Nu5ofFGZYd7NrGsCVNPA6L0SKb/j8GsuU7HBHMXhUTwKwe37IFSPyLfrj61cdWI/PYENv/kJnoYTmDWBNzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827873; c=relaxed/simple;
	bh=WxnqP+DV8xQuP2JHjYKcTaGfbq2XBpUHNk/4NxT2q10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X08l/ovWh/Eo6UP9vixrrQBXF/qeloL7i0e4Djgn83GSS9DdNaCqyMFaUZKpx4LN8bJuzgj4zFHnDFq4YPqaTu8BC//taRrKFA48prDjdFwKXqaYcg8abJIURB0vaKV0hMpTuiGILwrR508aokjU7X8t/Rtxck2F/i9Y69Hi1iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUHvNFsJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNzvB+wa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFBSkOd189259
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	za/9bxgWlgFijU3VcFHvQzIYEWrPV3j1ues0z0LnQ+c=; b=SUHvNFsJ+RhBTdJu
	ItWIUpYu+JrUKU7FSU0nLNah2YxRxuD2CieoN2P22iNY9rnM4Xr8t9YDzEOa/DKW
	7ZP0nrBq/6el+S1AU8xeqyG3ACgVQKZP3jsIQhswAHKAYM2IGns5IGafa2cyaNRw
	Y40bfkkxfjyGjsDEaPMaws0G/aeowJhlwkxdHMZYC/cmtLS54PnE0bl3oT2GJLWS
	iMkMSkQ/EghTD6JKr8Jctl0wTFFePH8BHqAsX7qi7+AKyHOKGkpbZPtSFHsP7LIY
	cRwQiURy2ERHcbayRz55T4VHcENBm2G21MXyHcNIWWBYRdDiJbFTF+E8EeLsdLBe
	kSu6WA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2hgasdft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:44:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0193a239so39959371cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765827870; x=1766432670; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=za/9bxgWlgFijU3VcFHvQzIYEWrPV3j1ues0z0LnQ+c=;
        b=kNzvB+waZ+owHTxRco1DVWPxDrTjYfQdOvCR2HlnMyGAiRbf/DA/KM5jmcCiunkeCi
         QHtOp4Q/+xVrmhVRiFMu4e6v1Vz6op14YRIJK0AnnHX+ooL3tzL5dO+ZdeVEcdiq2Hxz
         5XwQP8vJLNFMmmLDxyB8aZhk+Q6X3JKqOaD7o1FLwIs0oAfxTqPsY5CoBZbM8SUXL8cC
         NTaaO/Fw508QAzlIvP5mbfddU3OCICZYv8aZhIQ+4PGFU4hEleQzm+dD0eCVVByEKUdP
         wl6dBPBPTVqzMQBJ9KoJoPSFh3sqRZQpiaQw14z2z6TuV5u2dt8CDFDu35LK1fNvIIDt
         TO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827870; x=1766432670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=za/9bxgWlgFijU3VcFHvQzIYEWrPV3j1ues0z0LnQ+c=;
        b=ipMNIynvYyQEvQVDuNSsY6v31SbhrTs4J2CuObY/T5E4LMI/Gkn3Jovzs2R2osXMrL
         G1DCVqHaNjWxjJ3mDC8JlNhDbNZDPoNW0vzFsRBRrYkoi1deaUIYpfmz43znjGobnjVH
         deHdMjMjUkmZrmFobFaoETO16SLea1M5ol+qJEUo2tTakHtacBBsGx81QgMJK3x0HrOn
         uo9CADvafnWphN4dp0v1Uf6Nk8FvfjSrUwJZ3jLHGEyKG41T7N84vXS0oT1nX1a+9gMN
         ZGywF9xpQ0iutV1sp3c4z2yMoDjTZi4A/ztAbydu+0xDdsHT19yDhqj1Fm6paaq6Y8xs
         ioXA==
X-Forwarded-Encrypted: i=1; AJvYcCWEtyx7BKX3Duo8FaSIgTTQ6RkReo0S+cmU0VKgSFPs199E2BhHpiGwh7RYWlLdicBw5+ASpmyHewlDQrrH@vger.kernel.org
X-Gm-Message-State: AOJu0YyDCOByoKvwx4iH4gwQvgmN/dfeabiXtSJEd5Vifw9WnjkH4t1Z
	0ovaBOXHglSI5PvdrDQ+gvOewEO43O7T7x4bWb4/mKYuNE1FMCwhNEm8v9hsGvOz4N40GY4nrRy
	BR0kOpK8HH7bEMddVp0iSgRSSMgJFj05hUNxD4YxOp1xnzNU/isjD+Kl16QpNHUvip8H7
X-Gm-Gg: AY/fxX5iliKCneKu6NWJX7q0nIGelj8dOsFtJ7YQKwRKyyqWuVEeF3Pt6qSHn+fMDiN
	oZd6GCQsA7PnZx6l5QBoyfwHV9mRgRboFOnw3fnl+CJFRayCiAq4tWzNd977yFYi+owaAFazjTH
	5gnul22c3iZql0IEuSjYaDOkrKNmHS55PyRXWvQgQECuuhaz8ZimfhORX/yTtgd3SdWt5NS+kwy
	UEHTUq30WxVja5fa0vqnDcIB9W0njaeYgyHn/Y/gbH+nplR9p2oLsdXTBTBkqn3kOcYAKm+tmli
	JmmCXMeWxxnzkQr5wTHGmlArGDlc+KJcrjntTfpiC85qHBoiGJ+uVxq2QbGOUeU20fzqDevbN9O
	4wg4OSw3xSfHNYF9bNFlh0ZVNF9lusRXecc/dyVpCqeuQwDlwvJdYDIrWn1wR9/TCxT87Ul7qbJ
	YVeQjWO5EvS2AyzKyaXlPjpks=
X-Received: by 2002:a05:622a:4ac5:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f1d05df863mr182407621cf.46.1765827869431;
        Mon, 15 Dec 2025 11:44:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ0uYhuUhY5IM/R6GaNRHCJhJSEDXNyrM/lpNFd32MLQo4W39NjMhDfqtehVcXwbgk7e9s/g==
X-Received: by 2002:a05:622a:4ac5:b0:4ed:e595:bc85 with SMTP id d75a77b69052e-4f1d05df863mr182407121cf.46.1765827868842;
        Mon, 15 Dec 2025 11:44:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdedcae3bsm30621711fa.37.2025.12.15.11.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:44:28 -0800 (PST)
Date: Mon, 15 Dec 2025 21:44:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <zgzucan5ysxexmmjantx6sz7upbtouazj4hagjzlhaoo5hvzo5@limvqfce2lrw>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
 <CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com>
X-Proofpoint-GUID: bzLTZ5ISJ7613rQ8bZuFKN7zoCZ5_mF5
X-Proofpoint-ORIG-GUID: bzLTZ5ISJ7613rQ8bZuFKN7zoCZ5_mF5
X-Authority-Analysis: v=2.4 cv=GpxPO01C c=1 sm=1 tr=0 ts=6940651e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=wuo7t8k5axvA8L0-XpcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfX/MQam7Eb3fDy
 DeSS3g/EH+vi4oZ1kntXqQqCncHHwnoTZv3ABC80+O4Zgp8P0DcRAIh7ZOc3Ny2VQ+4WN//Q4el
 HptID8XhJgCvlABnx9/L2APqKtpa9zch4rrQCh2qWRe60c9iADBFutVK+agYpE3u3mVHk2OZjN9
 06yof1ZVgftEZDcA3doD+1ffu8Ir7CfGBxFuUwLGDGeoqHThurmXNzFnWFR4gvRzmo8dHc7OLkI
 QMMUVfdAz78br23zVFySot6KFYDHntrwGOjrNgeJjhr5ptUbkXhUwCw1Xgit2m4BCb3rDHDEA1d
 ir502HmrC4XfMczl3+ZMxYLPFryQlSPOecUdb/C+3toUVitdRgA3Cqu6406UE0bgVcWYGps7ru9
 um8KAMgdaTa6BfcKbTmQp4GgiBr1cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_04,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171

On Sat, Dec 13, 2025 at 08:58:56AM -0800, Matthew Maurer wrote:
> On Fri, Dec 12, 2025 at 7:55 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > > bindings.
> > >
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > > This patch converts the QC socinfo driver to Rust, intended to be the
> > > first Rust driver in Android that is owned by a vendor rather than the
> > > platform.
> > >
> > > This driver is currently quirk-compatible in DebugFS-exported values. If
> > > the maintainers do not believe that maintaining the exact formats is a
> > > benefit, we could simplify the code further by dropping some of the
> > > custom formatting functions used to match the output.
> > >
> > > I sent an earlier draft of this privately a while back that was much
> > > rougher, but didn't get much feedback.
> > >
> > > Now that we've got all the interfaces we need for this driver reasonably
> > > available (DebugFS was the one that took a bit here), I wanted to bring
> > > it up again, this time as an RFC. With the new features, the only place
> > > it needs `unsafe` is to define an abstraction over `qcom_get_smem`.
> > >
> > > I have tested this on a SM8650-HDK by diffing the contents of the
> > > exported DebugFS and examining the files under /sys/bus/soc/devices/soc0
> > >
> > > While I believe I have everything correctly exported via DebugFS, I have
> > > not checked equivalence across a large swath of devices, only the one.
> > > ---
> >
> > > +
> > > +pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'static [u8]> {
> > > +    let mut size = 0;
> > > +    // SAFETY: qcom_smem_get only requires that the size pointer be a writable size_t,
> > > +    // host and item are error checked in the qcom_smem module.
> > > +    let err_ptr = unsafe { kernel::bindings::qcom_smem_get(host as u32, item, &mut size) };
> > > +    let ptr = from_err_ptr(err_ptr)?;
> > > +    // SAFETY: If qcom_smem_get does not return an error, the returned pointer points to a readable
> > > +    // byte buffer with its size written into size. Because these buffers are derived from the
> > > +    // static ranges in the DT, this buffer remains accessible even if the qcom_smem module is
> > > +    // unloaded, so 'static is appropriate. The underlying buffer cannot mutate, so upgrading it
> > > +    // to a reference is allowed.
> >
> > This is definitely not true. The smem data is ioremap'ped during
> > qcom_smem_probe() and will be unmapped if qcom_smem is unloaded.
> > Accessing such a pointer after unloading smem would result in the
> > exception. Current socinfo ignores that and keeps on accessing the data
> > at runtime (which also allows it to read DSP versions which are updated
> > at runtime), but the comment needs to be corrected.
> 
> Thanks for the info. In v2 I'll look into seeing if I can make those
> slices hold a reference on the smem module while they're alive.

It should be a reference to the _bound_ device. I don't think we have
a way to do it. I suggest just fixing the comment instead.

> 
> >
> > > +    Ok(unsafe { core::slice::from_raw_parts(ptr as *const u8, size) })
> > > +}
> > > +
> >
> > > +
> > > +pub(crate) static SOC_IDS: &[SocId] = &[
> > > +    id_entry!(MSM8260),
> > > +    id_entry!(MSM8660),
> >
> > As we are performing a linear search over the array, would it be sensible
> > to sort it?
> 
> I directly copied the ordering used in the C code. We can't easily see
> that it's sorted at a source level, because the key is the soc ID,
> which comes from the device tree headers. For the first four elements
> at least, it *is* in sorted order already, we're just not currently
> relying on it. I could potentially add a debug assert to check that
> things are in sorted order and switch to assuming that if you'd like.

Sorry, I should be more explicit: sort by the name, not by the value. It
would make it easier to extend and reduce possible conflicts.

> 
> >
> > > +    id_entry!(APQ8060),
> > > +    id_entry!(MSM8960),
> >
> > > +
> > > +pub(crate) const PMIC_MODELS: [Option<&str>; 92] = {
> > > +    let mut models = [None; 92];
> >
> > I don't like the magic 92 appearing twice here just because the last
> > element of the array has number 91. Is there a sensible but idiomatic
> > way to express that (note in C we just use flex array without the size
> > and don't specify the size at all, so we don't have the duplication).
> 
> The usual way to do this in Rust is to use a slice (`&[Option<&str>]`)
> rather than an array (which looks like `[T; N]`, as I did above). The
> reason I didn't do it here was to avoid explicitly listing any punched
> holes (i.e. with slice, I'd have to write something like
> `&[Some("Foo"), None, Some("Bar")]`). Rust doesn't directly have a
> partial array initialization syntax because it requires that
> everything be fully initialized, which is why I was doing it through
> mutation. If we're going to leave everything default `None`, and
> express which elements should be `Some`, we need a bound on how many
> elements "everything" should be.
> 
> Some options:
> 1. Make holes explicit
> ```
> pub(crate) const PMIC_MODELS: &[Option<&'str>] = &[
>   Some("foo"),
>   Some("bar"),
>   None,
>   Some("baz"),
>   // ...
> };
> ```
> This is the one I'd suggest if we want to get rid of the 92. It has
> the downside of some extra explicit `None` entries, but the array
> isn't *that* sparse.
> 
> 2. Factor out 92 into a constant.
> 3. Define the constant in terms of index/value pairs instead. I could
> use `const`-time code to produce the array we want:
> ```
> const PMIC_ENTRIES: &[(usize, &str)] = &[(1, "foo"), (9, "bar"), (42, "baz")];
> 
> const PMIC_MODELS_LEN: usize = {
>     let mut max = 0;
>     let mut i = 0;
>     while i < PMIC_ENTRIES.len() {
>         if PMIC_ENTRIES[i].0 > max {
>             max = PMIC_ENTRIES[i].0;
>         }
>         i += 1;
>     }
>     max + 1
> };
> 
> pub const PMIC_MODELS: [Option<&'static str>; PMIC_MODELS_LEN] = {
>     let mut models = [None; PMIC_MODELS_LEN];
>     let mut i = 0;
>     while i < PMIC_ENTRIES.len() {
>         let (idx, val) = PMIC_ENTRIES[i];
>         models[idx] = Some(val);
>         i += 1;
>     }
>     models
> };
> ```
> (The slightly icky looking loops are because not all features are
> available in const mode.)
> This seems a bit overkill for what's going on.

I'd say, the easiet way would be to define PMIC_ENTRIES and then search
in it. It's the most idiomatic from my point of view. Other options
require extra knowledge or extra checks.

> >
> > > +    models[0] = Some("Unknown PMIC model");
> > > +    models[1] = Some("PM8941");
> > > +    models[2] = Some("PM8841");
> > > +    models[3] = Some("PM8019");
> > > +    models[4] = Some("PM8226");
> > > +    models[5] = Some("PM8110");
> > > +    models[6] = Some("PMA8084");
> > > +    models[7] = Some("PMI8962");
> > > +    models[8] = Some("PMD9635");
> > > +    models[9] = Some("PM8994");
> > > +    models[10] = Some("PMI8994");
> > > +    models[11] = Some("PM8916");
> > > +    models[12] = Some("PM8004");
> > > +    models[13] = Some("PM8909/PM8058");
> > > +    models[14] = Some("PM8028");
> > > +    models[15] = Some("PM8901");
> > > +    models[16] = Some("PM8950/PM8027");
> > > +    models[17] = Some("PMI8950/ISL9519");
> > > +    models[18] = Some("PMK8001/PM8921");
> > > +    models[19] = Some("PMI8996/PM8018");
> > > +    models[20] = Some("PM8998/PM8015");
> > > +    models[21] = Some("PMI8998/PM8014");
> > > +    models[22] = Some("PM8821");
> > > +    models[23] = Some("PM8038");
> > > +    models[24] = Some("PM8005/PM8922");
> > > +    models[25] = Some("PM8917/PM8937");
> > > +    models[26] = Some("PM660L");
> > > +    models[27] = Some("PM660");
> > > +    models[30] = Some("PM8150");
> > > +    models[31] = Some("PM8150L");
> > > +    models[32] = Some("PM8150B");
> > > +    models[33] = Some("PMK8002");
> > > +    models[36] = Some("PM8009");
> > > +    models[37] = Some("PMI632");
> > > +    models[38] = Some("PM8150C");
> > > +    models[40] = Some("PM6150");
> > > +    models[41] = Some("SMB2351");
> > > +    models[44] = Some("PM8008");
> > > +    models[45] = Some("PM6125");
> > > +    models[46] = Some("PM7250B");
> > > +    models[47] = Some("PMK8350");
> > > +    models[48] = Some("PM8350");
> > > +    models[49] = Some("PM8350C");
> > > +    models[50] = Some("PM8350B");
> > > +    models[51] = Some("PMR735A");
> > > +    models[52] = Some("PMR735B");
> > > +    models[54] = Some("PM6350");
> > > +    models[55] = Some("PM4125");
> > > +    models[58] = Some("PM8450");
> > > +    models[65] = Some("PM8010");
> > > +    models[69] = Some("PM8550VS");
> > > +    models[70] = Some("PM8550VE");
> > > +    models[71] = Some("PM8550B");
> > > +    models[72] = Some("PMR735D");
> > > +    models[73] = Some("PM8550");
> > > +    models[74] = Some("PMK8550");
> > > +    models[78] = Some("PMM8650AU");
> > > +    models[79] = Some("PMM8650AU_PSAIL");
> > > +    models[80] = Some("PM7550");
> > > +    models[82] = Some("PMC8380");
> > > +    models[83] = Some("SMB2360");
> > > +    models[91] = Some("PMIV0108");
> > > +    models
> > > +};
> > > +
> > > diff --git a/drivers/soc/qcom/socinfo/socinfo.rs b/drivers/soc/qcom/socinfo/socinfo.rs
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..bff1bf8fd672e3c461352075aa85ef8fdedff953
> > > --- /dev/null
> > > +++ b/drivers/soc/qcom/socinfo/socinfo.rs
> > > @@ -0,0 +1,362 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +// Copyright (C) 2025 Google LLC.
> > > +
> > > +//! Re-implementation of Qualcomm's Socinfo driver in Rust
> >
> > I think this comment can be dropped. If it gets merged, there is no old
> > Socinfo driver.
> 
> Agreed. We do need a crate level doc comment, but it can just say
> "Qualcomm SocInfo Driver" or something.

Just drop it here, it will go to the commit message.

> 
> >
> > > +use core::fmt;
> > > +use core::fmt::Formatter;
> > > +use kernel::debugfs::{Scope, ScopedDir};
> > > +use kernel::device::Core;
> > > +use kernel::module_platform_driver;
> > > +use kernel::platform::{self, Device};
> > > +use kernel::prelude::{fmt, pin_data, Error, PinInit, Result};
> > > +use kernel::soc;
> > > +use kernel::str::{CStr, CStrExt, CString};
> > > +use kernel::transmute::FromBytes;
> > > +use kernel::{c_str, pr_warn, try_pin_init};
> > > +use pin_init::pin_init_scope;
> > > +
> >
> > > +        let versions = self.versions.unwrap_or(&[]);
> > > +        let versions2 = self.versions2.unwrap_or(&[]);
> > > +        for (version, image_name) in versions
> > > +            .iter()
> > > +            .take(32)
> > > +            .chain(versions2.iter())
> > > +            .zip(IMAGE_NAMES.iter())
> > > +        {
> > > +            version.build_debugfs(dir, image_name);
> > > +        }
> >
> > I like this idiomatic code, we even get what original driver misses:
> > size checks for those memory regions.
> >
> > > +    }
> > > +}
> > > +
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

