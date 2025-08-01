Return-Path: <linux-arm-msm+bounces-67413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8289B186A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 19:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083295629C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA76242065;
	Fri,  1 Aug 2025 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkOKBOqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF7D26FA4B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754069168; cv=none; b=WV7yQDML0yQxTyrekfBrQP7xZJbW/qxEW4Co8HvNux9mNtGArJh0OHlVJCRsGYKeLjHVPosTvpnOU+BlOpGfn/0TEwaXXVsGRZkmd9OlOn3BUbUZkdNtoSexqTjavLwKzCQ5OUuSAKWX/LcwSTgcIddSXSMb15kC+dVN89NhH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754069168; c=relaxed/simple;
	bh=MdNitGZXzE66cMMSZImFec816f4hFdUUzZFH+WAD/+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5+vb3eqC35ov9359JZN18cNaeqq3uMDgpldIO5Kq97pGYVwQjXwp0zgsBT9N8HMUd1aP2E/s/xWYSbddU5wczhRwGF/4P3yf8nJkop6hDuQaSt9ChIx9UHY72x95GvsjYa2mJGa97rsIxP1Pw1eyuXiBpFOkGNyQr1twJYzlnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IkOKBOqA; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b7961cf660so1033366f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754069165; x=1754673965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6EiM/KJatc+ucR5mZfr0mKK62FA3tKj9rpi2bILnd/A=;
        b=IkOKBOqAzcPHViCAoMvLjiTvhcxKvRB+ndF6jsurHbldSn/B2XETipealQmRt0RNq6
         KxnNujv4tNFxG9o+o8htFrQmyuKIDbGwoncpWdAbWPub/MJeWvTJPnWkuRn7AKR9UVN8
         GxrnIrTKQVg0l8gvn1zkPGayG5ZmnOwS0LYF8chIUrch7wo7OngR3h4axfC7Xh9ad/j3
         sB+1qrhMONwIsqOtMZSOXgzWmnuXqK/L7eKGHdpOeLiBM9UtPWKlXjUTx4rGToA7jJsY
         vBxU+gMKjPVIfOZJwN46p/qKe3ptm/XhzdLdUasgW1cOinxr3uQths5A371DMkKEumrM
         YehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754069165; x=1754673965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EiM/KJatc+ucR5mZfr0mKK62FA3tKj9rpi2bILnd/A=;
        b=h5iQPy91x+MYppdC489EcmlRgNrO825pFg2XxGzrAWtSEe+ux67lo/ItVKJM369OUQ
         y/fZ1jOy4dWqNJaSfENhBkJnafnPJKLSImSXq8JLjuaNUCjxtPccp73HuZMSlzb6wMD9
         2eA0WwWzafdsLol6qi5e20faLOWnu3wWfIsmWeY5WDYbGe8y9Jr4+KU/Pdf8155YjOF/
         /QOaAf1upAm7JqhbXIVMpKqho/8iu1dJCfEaaP1KwWOJquTe6Fqoxt86wLBdNSTNlOLD
         6oN7y/X9BQQatL3xlhYpG8N5DdEsI0TaWOoINsaq6WPD4AXmD89hFC6NUuoFDfPmvQ6n
         iGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9/8nM/2Mi1R77HAy40PFLmrH9WsDnQXrEndTO5foM7Xf9excqIX351EobrvxL7PCxI4P7vXWrzvRbA61n@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNU/40GBV+eEQra8BuhlL5plHKimbscXXPegThhQB6wveYvLx
	KzkVQ6x8WAWGkBYJbmWNiUbaQvq7elRSJjvvu0Zvdrv0cPTkdoUxJOdoX2eQZQGClCc=
X-Gm-Gg: ASbGncsQD5NcSjEflh5bBDUIeIwCd47+xF2bZj4r8ZLJ7E+oSeL2RTiy06EcjY1EFF5
	LiQv7l/3lbbl/mXgjKx9+OkLyLn9CEI8/eERCdgn7MeRCeAhVgAKRj3QYzRMUupWNWDNsLhF4Q/
	eiB3sCXahlSW+EgrTzMS7Su5BCg3J+9H6JLfx1gsrx1SthFhj7UbHdXPTywT2Rz7X6BOrNLuVIa
	hFCL/5jzj41Fwo5m0YqkpXvN8TBsLNf0y5SHR0vg/xbRIt5v5A5ydSfVf5XmvTOpJL/spFSYcGr
	igO904gN8S9WTxGbDPiz45aKvzFdMh1SIQm5asJ8P0c/EK0E4mGDVqR36IqdxRnYEuFL3j48oFH
	J4N2xGy/saw7LKvmsVJtSWPUX/NQ=
X-Google-Smtp-Source: AGHT+IHAUeFa6/L6+DPVdGCHqTHNZKP+82EyvT7TFvOoB5/jAHJVvAhOUppBpUCtdqpOWh869tT/Sw==
X-Received: by 2002:a05:6000:2383:b0:3b7:810f:6caf with SMTP id ffacd0b85a97d-3b8d94bc74bmr495619f8f.32.1754069164946;
        Fri, 01 Aug 2025 10:26:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589edf55e4sm72892475e9.2.2025.08.01.10.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:26:04 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:25:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Mihai Moldovan <ionic@ionic.de>, linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v3 04/11] net: qrtr: support identical node ids
Message-ID: <aIz4pj5qgXSNg8mt@stanley.mountain>
References: <cover.1753312999.git.ionic@ionic.de>
 <8fc53fad3065a9860e3f44cf8853494dd6eb6b47.1753312999.git.ionic@ionic.de>
 <20250724130836.GL1150792@horms.kernel.org>
 <a42d70aa-76b8-4034-9695-2e639e6471a2@ionic.de>
 <20250727144014.GX1367887@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="r8QhGFlBadusXMk7"
Content-Disposition: inline
In-Reply-To: <20250727144014.GX1367887@horms.kernel.org>


--r8QhGFlBadusXMk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 27, 2025 at 03:40:14PM +0100, Simon Horman wrote:
> + Dan Carpenter
> 
> On Sun, Jul 27, 2025 at 03:09:38PM +0200, Mihai Moldovan wrote:
> > * On 7/24/25 15:08, Simon Horman wrote:
> > > [...]
> > 
> > Thank you for the reviews, to both you and Jakub.
> > 
> > 
> > > This will leak holding qrtr_nodes_lock.
> > 
> > It certainly does, will be fixed in v4.
> > 
> > 
> > > Flagged by Smatch.
> > 
> > I haven't used smatch before, and probably should do so going forward.
> > 
> > Curiously, a simple kchecker net/qrtr/ run did not warn about the locking
> > issue (albeit it being obvious in the patch), while it did warn about the
> > second issue with ret. Am I missing something?
> 
> TL;DR: No, I seem to have been able to reproduce what you see.
> 
> I ran Smatch, compiled from a recent Git commit, like this:
> 
> kchecker net/qrtr/af_qrtr.o
> 
> The warnings I saw (new to this patch) are:
> 
> net/qrtr/af_qrtr.c:498 qrtr_node_assign() warn: inconsistent returns 'global &qrtr_nodes_lock'.
>   Locked on  : 484
>   Unlocked on: 498
> net/qrtr/af_qrtr.c:613 qrtr_endpoint_post() warn: missing error code 'ret'
> 
> That was with Smatch compiled from Git [1]
> commit e1d933013098 ("return_efault: don't rely on the cross function DB")
> 
> I tried again with the latest head,
> commit 2fb2b9093c5d ("sleep_info: The synchronize_srcu() sleeps").
> And in that case I no longer see the 1st warning, about locking.
> I think this is what you saw too.
> 
> This seems to a regression in Smatch wrt this particular case for this
> code. I bisected Smatch and it looks like it was introduced in commit
> d0367cd8a993 ("ranges: use absolute instead implied for possibly_true/false")
> 
> I CCed Dan in case he wants to dig into this.

The code looks like this:

	spin_lock_irqsave(&qrtr_nodes_lock, flags);

        if (node->ep->id > QRTR_INDEX_HALF_UNSIGNED_MAX ||
            nid > QRTR_INDEX_HALF_UNSIGNED_MAX)
                return -EINVAL;

The problem is that QRTR_INDEX_HALF_UNSIGNED_MAX is U32_MAX and
node->ep->id and nid are both u32 type.  The return statement is dead
code and I deliberately silenced warnings on impossible paths.

The following patch will enable the warning again and I'll test it tonight
to see what happens.  If it's not too painful then I'll delete it
properly, but if it's generates a bunch of false positives then, in the
end, I'm not overly stressed about bugs in dead code.

regards,
dan carpenter


--r8QhGFlBadusXMk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/check_inconsistent_locking.c b/check_inconsistent_locking.c
index f3cce559d7a6..e95d9110a1e1 100644
--- a/check_inconsistent_locking.c
+++ b/check_inconsistent_locking.c
@@ -67,8 +67,8 @@ static void check_lock_bool(const char *name, struct symbol *sym)
 	FOR_EACH_PTR(get_all_return_strees(), stree) {
 		orig = __swap_cur_stree(stree);
 
-		if (is_impossible_path())
-			goto swap_stree;
+//		if (is_impossible_path())
+//			goto swap_stree;
 
 		return_sm = get_sm_state(RETURN_ID, "return_ranges", NULL);
 		if (!return_sm)
@@ -145,8 +145,8 @@ static void check_lock(const char *name, struct symbol *sym)
 	FOR_EACH_PTR(get_all_return_strees(), stree) {
 		orig = __swap_cur_stree(stree);
 
-		if (is_impossible_path())
-			goto swap_stree;
+//		if (is_impossible_path())
+//			goto swap_stree;
 
 		return_sm = get_sm_state(RETURN_ID, "return_ranges", NULL);
 		if (!return_sm)

--r8QhGFlBadusXMk7--

